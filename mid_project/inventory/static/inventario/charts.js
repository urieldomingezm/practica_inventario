
let stockChart;
let movementChart;
let userChart;

function loadStockData() {
    fetch('/api/products/')
        .then(response => response.json())
        .then(data => {
            const labels = data.map(product => product.name);
            const stockData = data.map(product => product.stock);

            if (stockChart) {
                stockChart.data.labels = labels;
                stockChart.data.datasets[0].data = stockData;
                stockChart.update();
            } else {
                const stockChartCtx = document.getElementById('stockChart').getContext('2d');
                stockChart = new Chart(stockChartCtx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Stock',
                            data: stockData,
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            }
        })
        .catch(error => console.error('Error al cargar datos de stock:', error));
}

function loadMovementData() {
    fetch('/api/inventory_movements/')
        .then(response => response.json())
        .then(data => {
            const movementsByDate = data.reduce((acc, movement) => {
                const date = new Date(movement.created_at).toLocaleDateString();
                if (!acc[date]) {
                    acc[date] = 0;
                }
                acc[date] += movement.quantity;
                return acc;
            }, {});

            const labels = Object.keys(movementsByDate);
            const movementData = Object.values(movementsByDate);

            if (movementChart) {
                movementChart.data.labels = labels;
                movementChart.data.datasets[0].data = movementData;
                movementChart.update();
            } else {
                const movementChartCtx = document.getElementById('movementChart').getContext('2d');
                movementChart = new Chart(movementChartCtx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Movimientos',
                            data: movementData,
                            backgroundColor: 'rgba(153, 102, 255, 0.2)',
                            borderColor: 'rgba(153, 102, 255, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            }
        })
        .catch(error => console.error('Error al cargar datos de movimientos:', error));
}

function loadUserData() {
    fetch('/api/users/')
        .then(response => response.json())
        .then(data => {
            const roleCounts = data.reduce((acc, user) => {
                acc[user.role] = (acc[user.role] || 0) + 1;
                return acc;
            }, {});

            const labels = Object.keys(roleCounts);
            const userData = Object.values(roleCounts);

            if (userChart) {
                userChart.data.labels = labels;
                userChart.data.datasets[0].data = userData;
                userChart.update();
            } else {
                const userChartCtx = document.getElementById('userChart').getContext('2d');
                userChart = new Chart(userChartCtx, {
                    type: 'doughnut',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Usuarios por Rol',
                            data: userData,
                            backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)'],
                            borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top'
                            }
                        }
                    }
                });
            }
        })
        .catch(error => console.error('Error al cargar datos de usuarios:', error));
}

document.addEventListener("DOMContentLoaded", function () {
    loadStockData();
    loadMovementData();
    loadUserData();
});