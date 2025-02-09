from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import ProductViewSet, InventoryMovementViewSet, UserProfileViewSet, login_view, logout_view, welcome_view, inventario_view

router = DefaultRouter()
router.register(r'products', ProductViewSet)
router.register(r'inventory_movements', InventoryMovementViewSet)
router.register(r'users', UserProfileViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('welcome/', welcome_view, name='welcome'),
    path('inventario/', inventario_view, name='inventario'),
]
