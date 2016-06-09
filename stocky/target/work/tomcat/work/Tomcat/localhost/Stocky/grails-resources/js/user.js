/**
 * Created by sanjeev-budha on 4/20/16.
 */

function createUser(){

    var data = $("#createUserForm").serialize();

    $.ajax({
        type:"POST",
        url:userUrl.saveUserUrl,
        data:data,
        success:function(data){
            if(data.messageType=="Success"){
                alert("Saved Successfully");

                window.location = userUrl.getUserUrl;
            }else{
                alert("Error while creating")
            }
        },error: function (er) {
            alert("Error while Creating")
        }
    });
    return false;
}



function deleteUserUrl(id){

    alert("Under Construction")
    /*var answer = confirm("Are you sure?")

    if(answer){

        $.ajax({
            type:"POST",
            url:userUrl.deleteUserUrl,
            data:{id:id},
            success:function(data){
                alert(data.messageType);
                if(data.messageType=="Success"){
                    alert("Deleted Successfully")
                    window.location = userUrl.getUserUrl;
                }else{
                    alert("Error while deleting")
                }
            },error: function  (er) {
                alert("Error")
            }
        });
    }
*/
    return false
}

function editUser(id){

    $.ajax({
        type:"POST",
        url:userUrl.editUserUrl,
        data:{id:id},
        success:function(data){
            $('#fName').val(data.firstName);
            $('#mName').val(data.middleName);
            $('#lName').val(data.lastName);
            $('#userId').val(data.username);
            $('#passwords').val(data.password);
            $('#emailId').val(data.email);
            //$('#roles').val(amPM);

            $('#saveUser').attr("onclick","return updateUser();");
            $('#user-id').attr("value",data.id)

            $('#add-user').modal('show');
            $('#add-user .modal-title').html("Edit this User")
            $('#add-user button[type=submit]').html("Save Changes")

        },error: function  (er) {
            alert("Error")
        }
    });

    return false

}

function updateUser(){

    var data = $("#createUserForm").serialize();

    $.ajax({
        type:"POST",
        url:userUrl.updateUserUrl,
        data:data,
        success:function(data){
            if(data.messageType=="Success"){
                alert("Updated Successfully")
                window.location.reload(true);
            }else{
                alert("Error while Updating")
            }
        },error: function (er) {
            alert("Error")
        }
    });
    return false;
}

