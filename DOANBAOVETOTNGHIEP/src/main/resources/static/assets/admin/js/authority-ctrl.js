app.controller("authority-ctrl", function($scope, $http, $location) {
    $scope.roles = [];
    $scope.admins = [];
    $scope.authorities = [];
    $scope.authoritiesCust = [];
    $scope.users = [];
    $scope.itemsUser = [];
    $scope.form = {};

    $scope.statisticalUsers = [];
    $scope.statisticalCategories = [];
    $scope.statisticalProducts = [];
    $scope.statisticalOrders = [];
    $scope.statisticalOrderDetails = [];

    $scope.orderDetailSuccess = [];
    $scope.orderDetailFail = [];
    $scope.orderDetailOnAir = [];
    $scope.orderDetailCancel = [];
    $scope.totalRevenue = [];
    $scope.totalQuantity = [];

    $scope.authorityDirector = [];
    $scope.authorityStaff = [];
    $scope.item = -1;

    $scope.initialize = function() {
        //load all roles
        $http.get("/rest/roles").then(resp => {
            $scope.roles = resp.data;
        })
        $http.get("/rest/accounts").then(resp => {
                $scope.admins = resp.data;
            })
            //load staffs and directors (adminstrators)
        $http.get("/rest/accounts?admin=true").then(resp => {
            $scope.admins = resp.data;
        })

        //load customers
        $http.get("/rest/accounts/user?cust=true").then(resp => {
            $scope.cust = resp.data;
        })

        //load authorities of staffs and directors
        $http.get("/rest/authorities?admin=true").then(resp => {
            $scope.authorities = resp.data;
        }).catch(error => {})

        //load authorities of customers
        $http.get("/rest/authorities/user?cust=true").then(resp => {
            $scope.authoritiesCust = resp.data;
        }).catch(error => {})

        //load all users
        $http.get("/rest/accounts/users").then(resp => {
            $scope.users = resp.data;
        })

        //load statistical users
        $http.get("/rest/statistical/users").then(resp => {
            $scope.statisticalUsers = resp.data;
        })

        //load statistical categories
        $http.get("/rest/statistical/categories").then(resp => {
            $scope.statisticalCategories = resp.data;
        })

        //load statistical products
        $http.get("/rest/statistical/products").then(resp => {
            $scope.statisticalProducts = resp.data;
        })

        //load statistical orders
        $http.get("/rest/statistical/orders").then(resp => {
            $scope.statisticalOrders = resp.data;
        })

        //load statistical orders details
        $http.get("/rest/statistical/orderDetails").then(resp => {
            $scope.statisticalOrderDetails = resp.data;
        })

        //load all orderDetail success
        $http.get("/rest/list/orders/success").then(resp => {
            $scope.orderDetailSuccess = resp.data;
        })

        //load all orderDetail fail
        $http.get("/rest/list/orders/fail").then(resp => {
            $scope.orderDetailFail = resp.data;
        })

        //load all orderDetail onair
        $http.get("/rest/list/orders/onair").then(resp => {
            $scope.orderDetailOnAir = resp.data;
        })

        //load all orderDetail cancel
        $http.get("/rest/list/orders/cancel").then(resp => {
            $scope.orderDetailCancel = resp.data;
        })

        //load totalRevenue
        $http.get("/rest/list/orders/totalRevenue").then(resp => {
            $scope.totalRevenue = resp.data;
        })

        //load totalQuantity
        $http.get("/rest/list/orders/totalQuantity").then(resp => {
            $scope.totalQuantity = resp.data;
        })

        //load authorityDirector
        $http.get("/rest/authorities/directors").then(resp => {
            $scope.authorityDirector = resp.data;
        })

        //load authorityStaff
        $http.get("/rest/authorities/staffs").then(resp => {
            $scope.authorityStaff = resp.data;
        })
    }

    //xoa form
    $scope.reset = function() {
        $scope.form = {
            image: 'no-image.png',
        };
    }

    $scope.authority_of = function(acc, role) {
        if ($scope.authorities) {
            return $scope.authorities.find(ur => ur.account.username == acc.username && ur.role.id == role.id);
        }
    }

    $scope.authority_of_cust = function(acc, role) {
        if ($scope.authoritiesCust) {
            return $scope.authoritiesCust.find(ur => ur.account.username == acc.username && ur.role.id == role.id);
        }
    }

    $scope.authority_changed = function(acc, role) {
        var authority = $scope.authority_of(acc, role);
        if (authority) { //da cap quyen => thu hoi quyen (xoa)
            $scope.revoke_authority(authority);
        } else { //chua duoc cap quyen => cap quyen(them moi)
            authority = { account: acc, role: role };
            $scope.grant_authority(authority);
        }
    }

    $scope.authority_changed_cust = function(acc, role) {
        var authority = $scope.authority_of_cust(acc, role);
        if (authority) { //da cap quyen => thu hoi quyen (xoa)
            $scope.revoke_authority(authority);
        } else { //chua duoc cap quyen => cap quyen(them moi)
            authority = { account: acc, role: role };
            $scope.grant_authority(authority);
        }
    }

    //them moi authority
    $scope.grant_authority = function(authority) {
        $http.post(`/rest/authorities`, authority).then(resp => {
            $scope.authorities.push(resp.data)
            swal("Th??nh c??ng!", "???? c???p quy???n s??? d???ng!", "success");
            $scope.initialize();
        }).catch(error => {
            sweetAlert("Th???t b???i!", "L???i c???p quy???n s??? d???ng", "error");
            console.log("error", error);
        })
    }

    //xoa authority
    $scope.revoke_authority = function(authority) {
        $http.delete(`/rest/authorities/${authority.id}`).then(resp => {
            var index = $scope.authorities.findIndex(a => a.id == authority.id);
            $scope.authorities.splice(index, 1);
            swal("Th??nh c??ng!", "???? thu h???i quy???n s??? d???ng!", "success");
            $scope.initialize();
        }).catch(error => {
            sweetAlert("Th???t b???i!", "L???i thu quy???n s??? d???ng", "error");
            console.log("error", error);
        })
    }

    // X??a form
    $scope.reset = function() {
        $scope.item = -1;
        $scope.form = {
            createDate: new Date(), // ng??y m???c ?????nh
            image: "no-image.png", // ???nh m???c ?????nh
            available: true,
        };
    }

    // HIEN THI LEN FORM
    $scope.edit = function(item) {
            $scope.item = item;
            $scope.form = angular.copy(item);
            $(".nav-tabs a:eq(0)").tab('show')
        }
        // $scope.create = function() {
        //     var item = angular.copy($scope.form);
        //     var username = document.myform.username.value;
        //     var password = document.myform.password.value;
        //     var gender = document.myform.gender.value;
        //     var phone = document.myform.phone.value;
        //     var fullname = document.myform.fullname.value;
        //     var address = document.myform.address.value;
        //     var email = document.myform.email.value;
        //     var atposition = email.indexOf("@");
        //     var dotposition = email.lastIndexOf(".");
        //     var image = document.myform.image.value;
        //     var status = false;
        //     if (username.length < 1) {
        //         document.getElementById("username").innerHTML =
        //             "Vui l??ng nh???p t??n ????ng nh???p";
        //         status = false;
        //     } else {
        //         document.getElementById("username").innerHTML =
        //             " ";
        //         status = true;
        //     }
        //     if (password.length < 6) {
        //         document.getElementById("password").innerHTML =
        //             "M???t kh???u ??t nh???t 6 k?? t???";
        //         status = false;
        //     } else {
        //         document.getElementById("password").innerHTML =
        //             " ";
        //     }
        //     if (image.length < 1) {
        //         document.getElementById("image").innerHTML =
        //             "Vui l??ng ch???n h??nh ???nh";
        //         status = false;
        //     } else {
        //         document.getElementById("image").innerHTML =
        //             " ";
        //     }
        //     if (fullname.length < 1) {
        //         document.getElementById("fullname").innerHTML =
        //             "Vui l??ng nh???p t??n ?????y ?????";
        //         status = false;
        //     } else {
        //         document.getElementById("fullname").innerHTML =
        //             " ";
        //         status = true;
        //     }
        //     if (address.length < 1) {
        //         document.getElementById("address").innerHTML =
        //             "Vui l??ng nh???p ?????a ch???";
        //         status = false;
        //     } else {
        //         document.getElementById("address").innerHTML =
        //             " ";
        //         status = true;
        //     }
        //     if (atposition < 1 || dotposition < (atposition + 2) ||
        //         (dotposition + 2) >= email.length) {
        //         document.getElementById("email").innerHTML =
        //             "Email nh???p ????ng ?????nh d???ng";
        //         status = false;
        //     } else {
        //         document.getElementById("email").innerHTML =
        //             " ";
        //         status = true;
        //     }
        //     if (gender.length < 1) {
        //         document.getElementById("gender").innerHTML =
        //             "Vui l??ng ch???n gi???i t??nh";
        //         status = false;
        //     } else {
        //         document.getElementById("gender").innerHTML =
        //             " ";
        //         status = true;
        //     }
        //     if (phone.length < 1) {
        //         document.getElementById("phone").innerHTML =
        //             "Vui l??ng nh???p s??? ??i???n tho???i";
        //         status = false;
        //     } else {
        //         document.getElementById("phone").innerHTML =
        //             " ";
        //         status = true;
        //     }
        //     $http.post(`/rest/accounts`, item).then(resp => {
        //         $scope.itemsUser.push(resp.data);
        //         $scope.reset();
        //         $scope.initialize();
        //         swal("Th??nh c??ng!", "???? th??m 1 ng?????i d??ng!", "success");
        //     }).catch(error => {
        //         sweetAlert("Th???t b???i!", "L???i th??m m???i", "error");
        //         console.log("Error", error);
        //     })
        // }

    $scope.update = function() {
        var item = angular.copy($scope.form);
        $http.put(`/rest/accounts/${item.id}`, item).then(resp => {
            var index = $scope.itemsUser.findIndex(p => p.id == item.id);
            $scope.itemsUser[index] = item;
            swal("Th??nh c??ng!", "C???p nh???t th??ng tin th??nh c??ng!", "success");
            $scope.reset();
            $scope.initialize();
        }).catch(error => {
            sweetAlert("Th???t b???i!", "L???i c???p nh???t th??ng tin", "error");
            console.log("Error", error);
        });
    }

    //xoa account
    $scope.delete = function(item) {
        swal({
            title: "B???n c?? mu???n x??a ng?????i d??ng n??y kh??ng?",
            icon: "info",
            buttons: true,
            dangerMode: true,
        }).then((purchase) => {
            if (purchase) {
                swal("Th??nh c??ng! Ng?????i d??ng ???? ???????c x??a", {
                    icon: "success",
                });
                $http.delete(`/rest/accounts/users/${item.username}`).then(resp => {
                    var index = $scope.itemsUser.findIndex(p => p.username == item.username);
                    $scope.itemsUser.splice(index, 1);
                    $scope.initialize();
                })
            } else {
                swal("H???y thao t??c!");
            }
        });
    }

    // upload h??nh
    $scope.imageChanged = function(files) {
        var data = new FormData();
        data.append('file', files[0]);
        $http.post('/rest/upload/images/', data, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            $scope.form.image = resp.data.name;

        }).catch(error => {
            alert("L???i Upload H??nh ???nh");
            console.log("Error", error);
        })
    }
    $scope.initialize();
    $scope.pager = {
        page: 0,
        size: 8,
        get users() {
            var start = this.page * this.size;
            return $scope.users.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil(1.0 * $scope.users.length / this.size);
        },
        first() {
            this.page = 0;
        },
        prev() {
            this.page--;
            if (this.page < 0) {
                this.last();
            }
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            }
        },
        last() {
            this.page = this.count - 1;
        }
    }
});