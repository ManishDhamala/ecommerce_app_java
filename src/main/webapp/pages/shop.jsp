<%--
  Created by IntelliJ IDEA.
  User: himalpun
  Date: 02/04/2024
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shop</title>
    <link rel="stylesheet" href="../styles/global.css">

    <link rel="stylesheet" href="../styles/css/shop.styles.css">
</head>
<body>
<!-- Header Start -->
<jsp:include page="header.jsp"/>
<%--header end--%>
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
        <div class="d-inline-flex">
            <p class="m-0 "><a href="../index.jsp" class="text-primary">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shop</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
            <!-- Price Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="price-all">
                        <label class="custom-control-label" for="price-all">All Price</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-1">
                        <label class="custom-control-label" for="price-1">$0 - $100</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-2">
                        <label class="custom-control-label" for="price-2">$100 - $200</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-3">
                        <label class="custom-control-label" for="price-3">$200 - $300</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-4">
                        <label class="custom-control-label" for="price-4">$300 - $400</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="price-5">
                        <label class="custom-control-label" for="price-5">$400 - $500</label>
                    </div>
                </form>
            </div>
            <!-- Price End -->

            <!-- Color Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="color-all">
                        <label class="custom-control-label" for="price-all">All Color</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-1">
                        <label class="custom-control-label" for="color-1">Black</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-2">
                        <label class="custom-control-label" for="color-2">White</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-3">
                        <label class="custom-control-label" for="color-3">Red</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-4">
                        <label class="custom-control-label" for="color-4">Blue</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="color-5">
                        <label class="custom-control-label" for="color-5">Green</label>
                    </div>
                </form>
            </div>
            <!-- Color End -->

            <!-- Size Start -->
            <div class="mb-5">
                <h5 class="font-weight-semi-bold mb-4">Filter by size</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="size-all">
                        <label class="custom-control-label" for="size-all">All Size</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-1">
                        <label class="custom-control-label" for="size-1">XS</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-2">
                        <label class="custom-control-label" for="size-2">S</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-3">
                        <label class="custom-control-label" for="size-3">M</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-4">
                        <label class="custom-control-label" for="size-4">L</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="size-5">
                        <label class="custom-control-label" for="size-5">XL</label>
                    </div>
                </form>
            </div>
            <!-- Size End -->
        </div>
        <!-- Shop Sidebar End -->


        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search by name">
                                <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                </div>
                            </div>
                        </form>
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId"
                                    data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                Sort by
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                <a class="dropdown-item" href="#">Latest</a>
                                <a class="dropdown-item" href="#">Popularity</a>
                                <a class="dropdown-item" href="#">Best Rating</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../assets/product-1.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6>
                                <h6 class="text-muted ml-2">
                                    <del>$123.00</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center"><img src="../assets/Icons/eye.png" alt="cart"
                                                                             style="width: 20px;height: 20px">View
                                Detail</a>

                                <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center">
                                    <img src="../assets/Icons/shopping-bag.png"
                                                                                 alt="cart"
                                                                                 style="width: 20px;height: 20px">Add To
                                    Cart</a>


                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../assets/product-2.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6>
                                <h6 class="text-muted ml-2">
                                    <del>$123.00</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center"><img src="../assets/Icons/eye.png" alt="cart"
                                                                                                             style="width: 20px;height: 20px">View
                                Detail</a>

                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center">
                                <img src="../assets/Icons/shopping-bag.png"
                                     alt="cart"
                                     style="width: 20px;height: 20px">Add To
                                Cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../assets/product-3.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6>
                                <h6 class="text-muted ml-2">
                                    <del>$123.00</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center"><img src="../assets/Icons/eye.png" alt="cart"
                                                                                                             style="width: 20px;height: 20px">View
                                Detail</a>

                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center">
                                <img src="../assets/Icons/shopping-bag.png"
                                     alt="cart"
                                     style="width: 20px;height: 20px">Add To
                                Cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../assets/product-4.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6>
                                <h6 class="text-muted ml-2">
                                    <del>$123.00</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center"><img src="../assets/Icons/eye.png" alt="cart"
                                                                                                             style="width: 20px;height: 20px">View
                                Detail</a>

                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center">
                                <img src="../assets/Icons/shopping-bag.png"
                                     alt="cart"
                                     style="width: 20px;height: 20px">Add To
                                Cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../assets/product-5.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6>
                                <h6 class="text-muted ml-2">
                                    <del>$123.00</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center"><img src="../assets/Icons/eye.png" alt="cart"
                                                                                                             style="width: 20px;height: 20px">View
                                Detail</a>

                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center">
                                <img src="../assets/Icons/shopping-bag.png"
                                     alt="cart"
                                     style="width: 20px;height: 20px">Add To
                                Cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../assets/product-6.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6>
                                <h6 class="text-muted ml-2">
                                    <del>$123.00</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center"><img src="../assets/Icons/eye.png" alt="cart"
                                                                                                             style="width: 20px;height: 20px">View
                                Detail</a>

                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center">
                                <img src="../assets/Icons/shopping-bag.png"
                                     alt="cart"
                                     style="width: 20px;height: 20px">Add To
                                Cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../assets/product-7.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6>
                                <h6 class="text-muted ml-2">
                                    <del>$123.00</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center"><img src="../assets/Icons/eye.png" alt="cart"
                                                                                                             style="width: 20px;height: 20px">View
                                Detail</a>

                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center">
                                <img src="../assets/Icons/shopping-bag.png"
                                     alt="cart"
                                     style="width: 20px;height: 20px">Add To
                                Cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../assets/product-8.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6>
                                <h6 class="text-muted ml-2">
                                    <del>$123.00</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center"><img src="../assets/Icons/eye.png" alt="cart"
                                                                                                             style="width: 20px;height: 20px">View
                                Detail</a>

                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center">
                                <img src="../assets/Icons/shopping-bag.png"
                                     alt="cart"
                                     style="width: 20px;height: 20px">Add To
                                Cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../assets/product-1.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6>
                                <h6 class="text-muted ml-2">
                                    <del>$123.00</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center"><img src="../assets/Icons/eye.png" alt="cart"
                                                                                                             style="width: 20px;height: 20px">View
                                Detail</a>

                            <a href="" class="btn btn-sm text-dark p-0 d-flex gap-3 align-items-center">
                                <img src="../assets/Icons/shopping-bag.png"
                                     alt="cart"
                                     style="width: 20px;height: 20px">Add To
                                Cart</a>
                        </div>
                    </div>
                </div>
                <%--                <div class="col-12 pb-1">--%>
                <%--                    <nav aria-label="Page navigation">--%>
                <%--                        <ul class="pagination justify-content-center mb-3">--%>
                <%--                            <li class="page-item disabled">--%>
                <%--                                <a class="page-link" href="#" aria-label="Previous">--%>
                <%--                                    <span aria-hidden="true">&laquo;</span>--%>
                <%--                                    <span class="sr-only">Previous</span>--%>
                <%--                                </a>--%>
                <%--                            </li>--%>
                <%--                            <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
                <%--                            <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                <%--                            <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                <%--                            <li class="page-item">--%>
                <%--                                <a class="page-link" href="#" aria-label="Next">--%>
                <%--                                    <span aria-hidden="true">&raquo;</span>--%>
                <%--                                    <span class="sr-only">Next</span>--%>
                <%--                                </a>--%>
                <%--                            </li>--%>
                <%--                        </ul>--%>
                <%--                    </nav>--%>
                <%--                </div>--%>
            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>

<!-- Footer Start -->
<jsp:include page="footer.jsp"/>
<%--footer end--%>


<script src="../script/myscript.js">
</script>
</body>
</html>
