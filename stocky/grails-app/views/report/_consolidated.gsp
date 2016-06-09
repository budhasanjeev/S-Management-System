<table style="width: 100%; text-align: center; overflow-x: scroll;" class="table table-bordered" id="executive-table">
    <thead style="color: #226CB5;">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>No. of Share</th>
        <th>Investment</th>
        <th>Contact No.</th>
        <th>Email</th>
        <th>Father's Name</th>
        <th>Grand Father's</th>
        <th>Permanent Address</th>
        <th>Citizenship No.</th>
        <th>Additional Investment</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${userLists}" var="u" status="i">
        <tr>
            <td>${u.id}</td>
            <td>${u.firstName}&nbsp;${u.lastName}</td>
            <td>${consolidatedList[i][1]}</td>
            <td>${consolidatedList[i][0]}</td>
            <td>${u.mobileNumber}</td>
            <td>${u.email}</td>
            <td>${additionalInfoLists[i].fatherName}</td>
            <td>${additionalInfoLists[i].grandFatherName}</td>
            <td>${additionalInfoLists[i].city},${additionalInfoLists[i].district}</td>
            <td>${additionalInfoLists[i].citizenshipNo}</td>
            <td>${consolidatedList[i][consolidatedList.size]}</td>
        </tr>
    </g:each>

    </tbody>
</table>
<style>
    table{
        font-size: 11px;
    }
</style>