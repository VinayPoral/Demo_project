<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DevOps Interactive Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background-color: #f0f2f5;
    }
    .header {
      padding: 20px;
      background-color: #007bff;
      color: white;
      text-align: center;
    }
    .dashboard {
      display: flex;
      flex-wrap: wrap;
      padding: 20px;
      gap: 20px;
      justify-content: center;
    }
    .card {
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 250px;
      text-align: center;
    }
    .card h2 {
      color: #007bff;
    }
    .refresh-btn {
      margin-top: 20px;
      padding: 10px 15px;
      background-color: #28a745;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .refresh-btn:hover {
      background-color: #218838;
    }
  </style>
</head>
<body>

  <div class="header">
    <h1>DevOps Dashboard</h1>
    <p>Live insights into deployment, server health, and performance metrics</p>
  </div>

  <div class="dashboard">
    <div class="card">
      <h2>Deployments</h2>
      <p id="deployments">Loading...</p>
    </div>
    <div class="card">
      <h2>Server Health</h2>
      <p id="serverHealth">Loading...</p>
    </div>
    <div class="card">
      <h2>CPU Usage</h2>
      <p id="cpuUsage">Loading...</p>
    </div>
    <div class="card">
      <h2>Memory Usage</h2>
      <p id="memoryUsage">Loading...</p>
    </div>
  </div>

  <div style="text-align: center; margin: 20px;">
    <button class="refresh-btn" onclick="refreshData()">Refresh Data</button>
  </div>

  <script>
    // Placeholder function to simulate fetching live data
    function fetchData() {
      return {
        deployments: Math.floor(Math.random() * 100),
        serverHealth: Math.floor(Math.random() * 100) + "%",
        cpuUsage: Math.floor(Math.random() * 100) + "%",
        memoryUsage: Math.floor(Math.random() * 100) + "%"
      };
    }

    // Function to update the dashboard with new data
    function refreshData() {
      const data = fetchData();
      document.getElementById('deployments').innerText = data.deployments;
      document.getElementById('serverHealth').innerText = data.serverHealth;
      document.getElementById('cpuUsage').innerText = data.cpuUsage;
      document.getElementById('memoryUsage').innerText = data.memoryUsage;
    }

    // Initial data load
    window.onload = refreshData;
  </script>
<div class="dashboard">
    <!-- Existing metrics... -->
    <div class="card">
      <h2>Build Times</h2>
      <canvas id="buildTimeChart" width="200" height="150"></canvas>
    </div>
    <div class="card">
      <h2>Deployment Success Rate</h2>
      <p id="successRate">Loading...</p>
    </div>
    <div class="card">
      <h2>Error Rate</h2>
      <canvas id="errorRateChart" width="200" height="150"></canvas>
    </div>
    <div class="card">
      <h2>Network Latency</h2>
      <p id="networkLatency">Loading...</p>
    </div>
</div>


<!-- Include Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  // Initialize a bar chart for build times
  const buildTimeChartCtx = document.getElementById('buildTimeChart').getContext('2d');
  const buildTimeChart = new Chart(buildTimeChartCtx, {
    type: 'bar',
    data: {
      labels: ['Build 1', 'Build 2', 'Build 3'], // Example labels
      datasets: [{
        label: 'Build Time (min)',
        data: [20, 15, 30], // Sample data
        backgroundColor: 'rgba(54, 162, 235, 0.6)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,
      scales: {
        y: { beginAtZero: true }
      }
    }
  });

  // You can similarly initialize error rate and other charts...
</script>

<div class="filters" style="text-align: center; margin: 20px;">
  <label for="dateRange">Select Date Range:</label>
  <input type="date" id="startDate">
  <input type="date" id="endDate">
  <button onclick="applyFilters()">Apply Filters</button>
</div>

<script>
  function applyFilters() {
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;
    alert(`Filtering data from ${startDate} to ${endDate}`);
    // Update data retrieval logic to filter based on selected dates
  }
</script>

<div class="card">
  <h2>Notifications</h2>
  <div id="notifications">
    <p>Loading notifications...</p>
  </div>
</div>

<script>
  function fetchNotifications() {
    const notifications = [
      "Deployment failed on server 3",
      "High CPU usage detected on server 5",
      "New release scheduled for tomorrow"
    ];
    document.getElementById('notifications').innerHTML = notifications.map(n => `<p>${n}</p>`).join("");
  }
  fetchNotifications();
</script>

<!-- Google Charts Library -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['gauge']});
  google.charts.setOnLoadCallback(drawGaugeChart);

  function drawGaugeChart() {
    const data = google.visualization.arrayToDataTable([
      ['Label', 'Value'],
      ['CPU', 80],
      ['Memory', 55],
      ['Disk', 68]
    ]);

    const options = {
      width: 200, height: 200,
      redFrom: 90, redTo: 100,
      yellowFrom:75, yellowTo: 90,
      minorTicks: 5
    };

    const chart = new google.visualization.Gauge(document.getElementById('gauge_div'));
    chart.draw(data, options);
  }
</script>

<div id="gauge_div" style="width: 200px; height: 200px;"></div>

<div class="tabs">
  <button class="tab-button" onclick="showTab('overview')">Overview</button>
  <button class="tab-button" onclick="showTab('builds')">Builds</button>
  <button class="tab-button" onclick="showTab('servers')">Servers</button>
  <button class="tab-button" onclick="showTab('networks')">Networks</button>
</div>

<div id="overview" class="tab-content">
  <h2>Overview</h2>
  <!-- Overview content here -->
</div>
<div id="builds" class="tab-content" style="display:none;">
  <h2>Builds</h2>
  <!-- Builds content here -->
</div>
<!-- Additional tab contents... -->

<script>
  function showTab(tabId) {
    document.querySelectorAll('.tab-content').forEach(div => div.style.display = 'none');
    document.getElementById(tabId).style.display = 'block';
  }
</script>
function fetchData(endpoint) {
  fetch(endpoint)
    .then(response => response.json())
    .then(data => {
      document.getElementById('deployments').innerText = data.deployments;
      document.getElementById('serverHealth').innerText = data.serverHealth;
      // Update other elements...
    });
}
fetchData('/api/devops-data');





</body>
</html>
