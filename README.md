MIB_PROJECT

📌 Descripción

MIB_PROJECT es un sistema de inventario desarrollado en Django con MySQL, utilizando tecnologías frontend como jQuery, Bootstrap, TailwindCSS y más. La aplicación Inventory gestiona productos, movimientos de inventario y roles de usuario, aunque actualmente hay fallas en el login y la edición de registros.

🚀 Tecnologías Usadas

🔧 Backend

Django

Django REST Framework (API REST)

MySQL

🎨 Frontend

jQuery

Bootstrap

TailwindCSS

Just-validate (validación de formularios)

SweetAlert2 (alertas interactivas)

DataTables (tablas dinámicas)

Chart.js (gráficos para dashboard)

Extras

Docker (pendiente de implementación)

⚙️ Instalación y Configuración

📌 Prerrequisitos

Python 3.x instalado

MySQL instalado y configurado

Node.js (opcional, para gestionar dependencias JS)

Docker (opcional)

📝 Clonar el Proyecto

git clone https://github.com/tu-usuario/MIB_PROJECT.git
cd MIB_PROJECT

👉 Instalar Dependencias

pip install mysqlclient djangorestframework djangorestframework-simplejwt

### Dependencias del Proyecto

El proyecto utiliza las siguientes dependencias:

- **asgiref**: 3.8.1
- **certifi**: 2024.2.2
- **distlib**: 0.3.8
- **Django**: 5.0.6
- **django-cors-headers**: 4.6.0
- **django-filter**: 24.3
- **djangorestframework**: 3.15.2
- **djangorestframework_simplejwt**: 5.4.0
- **filelock**: 3.14.0
- **mysqlclient**: 2.2.7
- **pillow**: 10.3.0
- **pip**: 24.0
- **pipenv**: 2023.12.1
- **platformdirs**: 4.2.1
- **PyJWT**: 2.10.1
- **PyMySQL**: 1.1.0
- **setuptools**: 69.5.1
- **sqlparse**: 0.5.0
- **tzdata**: 2024.1
- **virtualenv**: 20.26.2

🛠️ Configurar la Base de Datos

Crear una base de datos en MySQL:

CREATE DATABASE mib_project_db;

Configurar el acceso en settings.py:

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mib_project_db',
        'USER': 'tu_usuario',
        'PASSWORD': 'tu_contraseña',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}

Aplicar migraciones:

python manage.py migrate

Crear un superusuario:

python manage.py createsuperuser

🔄 Insertar registros en las tablas usando método shell

Ejecutar:

python manage.py shell

Inserción de datos:

from Inventory.models import UserProfile, Product, InventoryMovement

admin_user = UserProfile.objects.create_user(username="admin1", password="adminpass", role="admin")
staff_user = UserProfile.objects.create_user(username="staff1", password="staffpass", role="inventory_staff")

p1 = Product.objects.create(name="Teclado Mecánico", sku="TKB-001", stock=50, price=29.99)
p2 = Product.objects.create(name="Mouse Inalámbrico", sku="MOU-002", stock=30, price=19.99)
p3 = Product.objects.create(name="Monitor 24''", sku="MON-003", stock=20, price=199.99)

InventoryMovement.objects.create(product=p1, movement_type="IN", quantity=10)
InventoryMovement.objects.create(product=p2, movement_type="OUT", quantity=5)
InventoryMovement.objects.create(product=p3, movement_type="IN", quantity=15)
InventoryMovement.objects.create(product=p1, movement_type="OUT", quantity=8)

Product.objects.all()
InventoryMovement.objects.all()
UserProfile.objects.all()

🖥 Ejecutar el Proyecto

python manage.py runserver

Luego, accede a http://127.0.0.1:8000/.Para ver productos: http://127.0.0.1:8000/api/products/Para ver usuarios: http://127.0.0.1:8000/api/users/Para ver movimientos: http://127.0.0.1:8000/api/inventory_movements/

📀 Funcionalidades Implementadas

✅ CRUD de productos (con fallas en editar)✅ Registro de movimientos de inventario✅ Tabla dinámica con DataTables✅ Dashboard con gráficas de Chart.js✅ Validaciones con Just-validate✅ SweetAlert2 para alertas

🔴 Pendiente:
⚠️ Login funcional
⚠️ Protección de endpoints según roles
⚠️ Edición de registros

🐋 Docker (Opcional)

docker build -t mib_project .
docker run -p 8000:8000 mib_project

📝 Notas Finales

Este proyecto es parte de una prueba técnica y aún tiene errores que deben corregirse. Se aceptan contribuciones para mejorar el login y la edición de productos.

📌 Autor: ANGEL URIEL DOMINGUEZ MEDINA📌 
Repositorio: GitHub Repo
