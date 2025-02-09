from django.db import models
from django.contrib.auth.models import AbstractUser

class UserProfile(AbstractUser):
    ROLE_CHOICES = [
        ('admin', 'Admin'),
        ('inventory_staff', 'Inventory Staff'),
    ]
    role = models.CharField(max_length=20, choices=ROLE_CHOICES)

    groups = models.ManyToManyField(
        "auth.Group",
        related_name="user_profiles",
        blank=True
    )
    user_permissions = models.ManyToManyField(
        "auth.Permission",
        related_name="user_profiles",
        blank=True
    )

class Product(models.Model):
    name = models.CharField(max_length=255)
    sku = models.CharField(max_length=100, unique=True)
    stock = models.PositiveIntegerField(default=0)
    price = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.name

class InventoryMovement(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    movement_type = models.CharField(max_length=10, choices=[('IN', 'Entrada'), ('OUT', 'Salida')])
    quantity = models.PositiveIntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.movement_type} - {self.quantity} unidades de {self.product.name}"
