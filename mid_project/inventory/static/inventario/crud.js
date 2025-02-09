
function editProduct(productId) {
    fetch(`/api/products/${productId}/`)
        .then(response => response.json())
        .then(product => {
            document.getElementById('editName').value = product.name;
            document.getElementById('editStock').value = product.stock;
            document.getElementById('editPrice').value = product.price;
            const editModal = new bootstrap.Modal(document.getElementById('editModal'));
            editModal.show();

            document.getElementById('editForm').onsubmit = function (e) {
                e.preventDefault();
                const updatedProduct = {
                    name: document.getElementById('editName').value,
                    stock: document.getElementById('editStock').value,
                    price: document.getElementById('editPrice').value
                };
                fetch(`/api/products/${productId}/`, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value
                    },
                    body: JSON.stringify(updatedProduct)
                })
                    .then(response => response.json())
                    .then(data => {
                        loadProducts();
                        editModal.hide();
                        Swal.fire({
                            icon: 'success',
                            title: 'Producto actualizado',
                            text: 'El producto se ha actualizado correctamente.'
                        });
                    })
                    .catch(error => {
                        console.error('Error al editar el producto:', error);
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Hubo un problema al actualizar el producto.'
                        });
                    });
            };
        })
        .catch(error => console.error('Error al obtener el producto:', error));
}

function deleteProduct(productId) {
    Swal.fire({
        title: '¿Estás seguro?',
        text: "¡No podrás revertir esto!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminarlo'
    }).then((result) => {
        if (result.isConfirmed) {
            fetch(`/api/products/${productId}/`, {
                method: 'DELETE',
                headers: {
                    'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value
                }
            })
                .then(() => {
                    loadProducts();
                    Swal.fire({
                        icon: 'success',
                        title: 'Producto eliminado',
                        text: 'El producto se ha eliminado correctamente.'
                    });
                })
                .catch(error => {
                    console.error('Error al eliminar el producto:', error);
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Hubo un problema al eliminar el producto.'
                    });
                });
        }
    });
}

function showMovements(productId) {
    fetch(`/api/inventory_movements/?product=${productId}`)
        .then(response => response.json())
        .then(data => {
            const movementDetailsTable = document.getElementById('movementDetailsTable');
            movementDetailsTable.innerHTML = '';
            data.forEach(movement => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${movement.movement_type}</td>
                    <td>${movement.quantity}</td>
                    <td>${new Date(movement.created_at).toLocaleString()}</td>
                `;
                movementDetailsTable.appendChild(row);
            });
            const movementModal = new bootstrap.Modal(document.getElementById('movementModal'));
            movementModal.show();
        })
        .catch(error => console.error('Error al cargar los movimientos:', error));
}

function editUser(userId) {
    Swal.fire({
        icon: 'info',
        title: 'Editar Usuario',
        text: 'Esta funcionalidad está en desarrollo.'
    });
}

function deleteUser(userId) {
    Swal.fire({
        title: '¿Estás seguro?',
        text: "¡No podrás revertir esto!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminarlo'
    }).then((result) => {
        if (result.isConfirmed) {
            fetch(`/api/users/${userId}/`, {
                method: 'DELETE',
                headers: {
                    'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value
                }
            })
                .then(() => {
                    loadUsers();
                    Swal.fire({
                        icon: 'success',
                        title: 'Usuario eliminado',
                        text: 'El usuario se ha eliminado correctamente.'
                    });
                })
                .catch(error => {
                    console.error('Error al eliminar el usuario:', error);
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Hubo un problema al eliminar el usuario.'
                    });
                });
        }
    });
}