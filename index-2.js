var tableData = Data;
var tbody = d3.select("tbody");
function buildingTable(data) {
    tbody.html("");
    data.forEach((dataRow) => {
        var row = tbody.append("tr");
      Object.values(dataRow).forEach((val) => {
          var cell = row.append("td");
          cell.text(val);

      } 
    ); 
    });

}

function handleClick() {
    d3.event.preventDefault();
    let filteredData = tableData;
    if (date) {
        filteredData = filteredData.filter(row.datetime === date);

    }
buildingTable(filteredData);

}
d3.select("#filter-btn").on("click", handleClick);
buildTable(tableDta);