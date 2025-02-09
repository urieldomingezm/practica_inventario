
function sortTable(tableId, columnIndex) {
    const table = document.getElementById(tableId);
    const rows = Array.from(table.querySelectorAll('tbody tr'));
    const isAscending = table.getAttribute('data-sort-asc') === 'true';

    rows.sort((a, b) => {
        const aValue = a.cells[columnIndex].textContent.trim();
        const bValue = b.cells[columnIndex].textContent.trim();
        return isAscending ? aValue.localeCompare(bValue) : bValue.localeCompare(aValue);
    });

    table.setAttribute('data-sort-asc', !isAscending);
    table.querySelector('tbody').innerHTML = '';
    rows.forEach(row => table.querySelector('tbody').appendChild(row));
}