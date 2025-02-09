
function searchProduct() {
    const searchQuery = document.getElementById('search').value.toLowerCase();
    const rows = document.querySelectorAll('#productTable tr');
    rows.forEach(row => {
        const name = row.querySelector('td').textContent.toLowerCase();
        row.style.display = name.includes(searchQuery) ? '' : 'none';
    });
}

function searchMovement() {
    const searchQuery = document.getElementById('searchMovement').value.toLowerCase();
    const rows = document.querySelectorAll('#movementTable tr');
    rows.forEach(row => {
        const productName = row.querySelector('td').textContent.toLowerCase();
        row.style.display = productName.includes(searchQuery) ? '' : 'none';
    });
}

function searchUser() {
    const searchQuery = document.getElementById('searchUser').value.toLowerCase();
    const rows = document.querySelectorAll('#userTable tr');
    rows.forEach(row => {
        const username = row.querySelector('td').textContent.toLowerCase();
        row.style.display = username.includes(searchQuery) ? '' : 'none';
    });
}