
function loadProducts() {
    fetch('/api/products/')
        .then(response => response.json())
        .then(data => {
            const productTable = document.getElementById('productTable');
            productTable.innerHTML = '';
            data.forEach(product => {
                const row = document.createElement('tr');
                row.setAttribute('id', `product-${product.id}`);
                row.innerHTML = `
                    <td>${product.name}</td>
                    <td>${product.stock}</td>
                    <td>${product.price}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editProduct(${product.id})">Editar</button>
                        <button class="btn btn-danger btn-sm" onclick="deleteProduct(${product.id})">Eliminar</button>
                        <button class="btn btn-info btn-sm" onclick="showMovements(${product.id})">Ver Movimientos</button>
                    </td>
                `;
                productTable.appendChild(row);
            });
        })
        .catch(error => console.error('Error al cargar los productos:', error));
}

function loadMovements() {
    fetch('/api/inventory_movements/')
        .then(response => response.json())
        .then(data => {
            const movementTable = document.getElementById('movementTable');
            movementTable.innerHTML = '';
            data.forEach(movement => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${movement.product.name}</td>
                    <td>${movement.movement_type}</td>
                    <td>${movement.quantity}</td>
                    <td>${new Date(movement.created_at).toLocaleString()}</td>
                `;
                movementTable.appendChild(row);
            });
        })
        .catch(error => console.error('Error al cargar los movimientos:', error));
}

function loadUsers() {
    fetch('/api/users/')
        .then(response => response.json())
        .then(data => {
            const userTable = document.getElementById('userTable');
            userTable.innerHTML = '';
            data.forEach(user => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${user.username}</td>
                    <td>${user.role}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editUser(${user.id})">Editar</button>
                        <button class="btn btn-danger btn-sm" onclick="deleteUser(${user.id})">Eliminar</button>
                    </td>
                `;
                userTable.appendChild(row);
            });
        })
        .catch(error => console.error('Error al cargar los usuarios:', error));
}

document.addEventListener("DOMContentLoaded", function () {
    loadProducts();
    loadMovements();
    loadUsers();
});