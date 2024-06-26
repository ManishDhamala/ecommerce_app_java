<%--
  Created by IntelliJ IDEA.
  User: himalpun
  Date: 03/04/2024
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Single Product</title>
    <link rel="stylesheet" href="../styles/global.css">
</head>
<body>
<%--Header--%>
<jsp:include page="header.jsp"/>

<%--Single Product--%>
<!-- content -->
<section class="py-5">
    <div class="container">
        <div class="row gx-5">
            <aside class="col-lg-6">
                <div class="border rounded-4 mb-3 d-flex justify-content-center">
                    <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image"
                       href="">
                        <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit"
                             src="../assets/keyboard.jpg"/>
                    </a>
                </div>
                <!-- thumbs-wrap.// -->
                <!-- gallery-wrap .end// -->
            </aside>
            <main class="col-lg-6">
                <div class="ps-lg-3">
                    <h4 class="title text-dark">
                        Quality Men's Hoodie for Winter, Men's Fashion <br/>
                        Casual Hoodie
                    </h4>

                    <div class="mb-3">
                        <span class="h5">$75.00</span>
                        <span class="text-muted">/per box</span>
                    </div>

                    <p>
                        Modern look and quality demo item is a streetwear-inspired collection that continues to break
                        away from the conventions of mainstream fashion. Made in Italy, these black and brown clothing
                        low-top shirts for
                        men.
                    </p>

                    <div class="row">
                        <dt class="col-3">Type:</dt>
                        <dd class="col-9">Regular</dd>

                        <dt class="col-3">Color</dt>
                        <dd class="col-9">Brown</dd>

                        <dt class="col-3">Material</dt>
                        <dd class="col-9">Cotton, Jeans</dd>

                        <dt class="col-3">Brand</dt>
                        <dd class="col-9">Reebook</dd>
                    </div>

                    <hr/>

                    <div class="row mb-4">
                        <div class="col-md-4 col-6">
                            <label class="mb-2">Size</label>
                            <select class="form-select border border-secondary" style="height: 35px;">
                                <option>Small</option>
                                <option>Medium</option>
                                <option>Large</option>
                            </select>
                        </div>
                        <!-- col.// -->
                        <div class="col-md-4 col-6 mb-3">
                            <label class="mb-2 d-block">Quantity</label>
                            <div class="input-group mb-3" style="width: 170px;">
                                <button class="btn btn-white border border-secondary px-3" type="button"
                                        id="button-addon1" data-mdb-ripple-color="dark">
                                    -
                                </button>
                                <input type="text" class="form-control text-center border border-secondary"
                                       placeholder="14" aria-label="Example text with button addon"
                                       aria-describedby="button-addon1"/>
                                <button class="btn btn-white border border-secondary px-3" type="button"
                                        id="button-addon2" data-mdb-ripple-color="dark">
                                    +
                                </button>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="btn btn-warning shadow-0"> Buy now </a>
                    <a href="#" class="btn btn-primary shadow-0"> <img src="../assets/Icons/shopping-bag.png" alt="carts" style="width: 20px;height: 20px"/>Add to carts
                    </a>
                    <a href="#" class="btn btn-light border border-secondary py-2 icon-hover px-3"> <i
                            class="me-1 fa fa-heart fa-lg"></i> Save </a>
                </div>
            </main>
        </div>
    </div>
</section>
<!-- content -->

<section class="bg-light border-top py-4">
    <div class="container">
        <div class="row gx-4">
            <div class="col-lg-8 mb-4">
                <div class="border rounded-2 px-3 py-2 bg-white">
                    <!-- Pills navs -->
                    <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                        <li class="nav-item d-flex" role="presentation">
                            <a class="nav-link d-flex align-items-center justify-content-center w-100 active"
                               id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab"
                               aria-controls="ex1-pills-1" aria-selected="true">Specification</a>
                        </li>
                    </ul>
                    <!-- Pills navs -->

                    <!-- Pills content -->
                    <div class="tab-content" id="ex1-content">
                        <div class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel"
                             aria-labelledby="ex1-tab-1">
                            <p>
                                With supporting text below as a natural lead-in to additional content. Lorem ipsum dolor
                                sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                dolore magna aliqua. Ut
                                enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                                dolore eu fugiat nulla
                                pariatur.
                            </p>
                            <div class="row mb-2">
                                <div class="col-12 col-md-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><i class="fas fa-check text-success me-2"></i>Some great feature name here
                                        </li>
                                        <li><i class="fas fa-check text-success me-2"></i>Lorem ipsum dolor sit amet,
                                            consectetur
                                        </li>
                                        <li><i class="fas fa-check text-success me-2"></i>Duis aute irure dolor in
                                            reprehenderit
                                        </li>
                                        <li><i class="fas fa-check text-success me-2"></i>Optical heart sensor</li>
                                    </ul>
                                </div>
                                <div class="col-12 col-md-6 mb-0">
                                    <ul class="list-unstyled">
                                        <li><i class="fas fa-check text-success me-2"></i>Easy fast and ver good</li>
                                        <li><i class="fas fa-check text-success me-2"></i>Some great feature name here
                                        </li>
                                        <li><i class="fas fa-check text-success me-2"></i>Modern style and design</li>
                                    </ul>
                                </div>
                            </div>
                            <table class="table border mt-3 mb-2">
                                <tr>
                                    <th class="py-2">Display:</th>
                                    <td class="py-2">13.3-inch LED-backlit display with IPS</td>
                                </tr>
                                <tr>
                                    <th class="py-2">Processor capacity:</th>
                                    <td class="py-2">2.3GHz dual-core Intel Core i5</td>
                                </tr>
                                <tr>
                                    <th class="py-2">Camera quality:</th>
                                    <td class="py-2">720p FaceTime HD camera</td>
                                </tr>
                                <tr>
                                    <th class="py-2">Memory</th>
                                    <td class="py-2">8 GB RAM or 16 GB RAM</td>
                                </tr>
                                <tr>
                                    <th class="py-2">Graphics</th>
                                    <td class="py-2">Intel Iris Plus Graphics 640</td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade mb-2" id="ex1-pills-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                            Tab content or sample information now <br/>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                            ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut
                            aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
                            esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                            sunt in culpa qui
                            officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur
                            adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                            ad minim veniam, quis
                            nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        </div>
                        <div class="tab-pane fade mb-2" id="ex1-pills-3" role="tabpanel" aria-labelledby="ex1-tab-3">
                            Another tab content or sample information now <br/>
                            Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                            dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                            ut aliquip ex ea
                            commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                            dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                            culpa qui officia deserunt
                            mollit anim id est laborum.
                        </div>
                        <div class="tab-pane fade mb-2" id="ex1-pills-4" role="tabpanel" aria-labelledby="ex1-tab-4">
                            Some other tab content or sample information now <br/>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                            ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut
                            aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
                            esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                            sunt in culpa qui
                            officia deserunt mollit anim id est laborum.
                        </div>
                    </div>
                    <!-- Pills content -->
                </div>
            </div>
            <div class="col-lg-4">
                <div class="px-0 border rounded-2 shadow-0">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Similar items</h5>
                            <div class="d-flex mb-3">
                                <a href="#" class="me-3">
                                    <img src="../assets/joystick.jpg"
                                         alt="Joystick"
                                         style="min-width: 96px; height: 96px;" class="img-md img-thumbnail"/>
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1">
                                        Rucksack Backpack Large <br/>
                                        Line Mounts
                                    </a>
                                    <strong class="text-dark"> $38.90</strong>
                                </div>
                            </div>

                            <div class="d-flex mb-3">
                                <a href="#" class="me-3">
                                    <img src="../assets/joystick.jpg"
                                         alt="Joystick"
                                         style="min-width: 96px; height: 96px;" class="img-md img-thumbnail"/>
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1">
                                        Summer New Men's Denim <br/>
                                        Jeans Shorts
                                    </a>
                                    <strong class="text-dark"> $29.50</strong>
                                </div>
                            </div>

                            <div class="d-flex mb-3">
                                <a href="#" class="me-3">
                                    <img src="../assets/joystick.jpg"
                                         alt="Joystick"
                                         style="min-width: 96px; height: 96px;" class="img-md img-thumbnail"/>
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1"> T-shirts with multiple colors, for men and
                                        lady </a>
                                    <strong class="text-dark"> $120.00</strong>
                                </div>
                            </div>

                            <div class="d-flex">
                                <a href="#" class="me-3">
                                    <img src="../assets/joystick.jpg"
                                         alt="Joystick"
                                         style="min-width: 96px; height: 96px;" class="img-md img-thumbnail"/>
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1"> Blazer Suit Dress Jacket for Men, Blue color </a>
                                    <strong class="text-dark"> $339.90</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%--Footer--%>
<jsp:include page="footer.jsp"/>
</body>
</html>
