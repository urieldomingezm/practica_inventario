from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth import get_user_model
from rest_framework import viewsets, permissions
from .models import Product, InventoryMovement
from .serializers import ProductSerializer, InventoryMovementSerializer, UserProfileSerializer

User = get_user_model()

def login_view(request):
    """Vista para iniciar sesión"""
    if request.user.is_authenticated:
        return redirect("welcome") 
    
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            login(request, user)
            messages.success(request, "Inicio de sesión exitoso")
            return redirect("welcome") 
        else:
            messages.error(request, "Usuario o contraseña incorrectos")
    
    return render(request, "inventory/login.html")

def logout_view(request):
    """Cierra sesión y redirige al login"""
    logout(request)
    messages.success(request, "Has cerrado sesión correctamente")
    return redirect("login")

@login_required(login_url='login') 
def welcome_view(request):
    """Vista de bienvenida antes de acceder al inventario"""
    return render(request, "inventory/welcome.html")

@login_required(login_url='login')  
def inventario_view(request):
    """Vista protegida del inventario"""
    return render(request, "inventory/inventario.html")

def index(request):
    """Vista de inicio"""
    return render(request, 'inventory/index.html')

class UserProfileViewSet(viewsets.ModelViewSet):
    """API de usuarios"""
    queryset = User.objects.all()
    serializer_class = UserProfileSerializer
    permission_classes = [permissions.AllowAny]

class ProductViewSet(viewsets.ModelViewSet):
    """API de productos"""
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    
    def get_permissions(self):
        if self.request.method in ['POST', 'DELETE']:
            return [permissions.IsAdminUser()]
        return [permissions.AllowAny()]

class InventoryMovementViewSet(viewsets.ModelViewSet):
    """API de movimientos de inventario"""
    queryset = InventoryMovement.objects.all()
    serializer_class = InventoryMovementSerializer
    permission_classes = [permissions.AllowAny]
