from django.contrib import admin
from django.urls import path, include
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from inventory.views import index, login_view, logout_view, welcome_view, inventario_view

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('inventory.urls')),

    path('', index, name='index'),
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('welcome/', welcome_view, name='welcome'),
    path('inventario/', inventario_view, name='inventario'),
    
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]
