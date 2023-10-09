<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sales Report</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="This is an example dashboard created using build-in elements and components.">
<meta name="msapplication-tap-highlight" content="no">
<link
	href="https://demo.dashboardpack.com/architectui-html-free/main.css"
	rel="stylesheet">
</head>
<body>
	<%
	Double daily = (Double) request.getAttribute("totalSalesDaily");
	Double week = (Double) request.getAttribute("totalSalesWeek");
	Double month = (Double) request.getAttribute("totalSalesMonth");
	Double year = (Double) request.getAttribute("totalSalesYear");
	Double lifetime = (Double) request.getAttribute("totalSalesLifetime");
	%>
	<div class="app-header header-shadow">
		<div class="app-header__logo">
<!-- 			<div class="logo-src"></div> -->
			<div class="header__pane ml-auto">
				<div>
					<button type="button"
						class="hamburger close-sidebar-btn hamburger--elastic"
						data-class="closed-sidebar">
						<span class="hamburger-box"> <span class="hamburger-inner"></span>
						</span>
					</button>
				</div>
			</div>
		</div>
		
		
		<div class="app-header__mobile-menu">
			<div>
				<button type="button"
					class="hamburger hamburger--elastic mobile-toggle-nav">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
		<div class="app-header__menu">
		
			<span>
				<button type="button"
					class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
					<span class="btn-icon-wrapper"> <i
						class="fa fa-ellipsis-v fa-w-6"></i>
					</span>
				</button>
			</span>
		</div>
		<div class="app-header__content">
			<div class="app-header-left">
				<h4>Sales Report</h4>
				<div class="search-wrapper">
					<!-- -- <div class="input-holder">
<input type="text" class="search-input" placeholder="Type to search">
<button class="search-icon"><span></span></button>
</div>---->
					<button class="close"></button>
				</div>
			</div>
			<div class="app-header-right">
				<div class="header-btn-lg pr-0">
					<div class="widget-content p-0">
						<div class="widget-content-wrapper">
							<div class="widget-content-left ml-3 header-user-info">
								<div class="widget-heading">Muhammad Nur Aiman</div>
								<div class="widget-subheading">Admin 1</div>
							</div>
							<div class="widget-content-right header-user-info ml-3">
								<button type="button"
									class="btn-shadow p-1 btn btn-primary btn-sm show-toastr-example">
									<i class="fa text-white fa-calendar pr-1 pl-1"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="ui-theme-settings">
		<button type="button" id="TooltipDemo"
			class="btn-open-options btn btn-warning">
			<i class="fa fa-cog fa-w-16 fa-spin fa-2x"></i>
		</button>
		<div class="theme-settings__inner">
			<div class="scrollbar-container">
				<div class="theme-settings__options-wrapper">
					<h3 class="themeoptions-heading">Layout Options</h3>
					<div class="p-3">
						<ul class="list-group">
							<li class="list-group-item">
								<div class="widget-content p-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left mr-3">
											<div class="switch has-switch switch-container-class"
												data-class="fixed-header">
												<div class="switch-animate switch-on">
													<input type="checkbox" checked data-toggle="toggle"
														data-onstyle="success">
												</div>
											</div>
										</div>
										<div class="widget-content-left">
											<div class="widget-heading">Fixed Header</div>
											<div class="widget-subheading">Makes the header top
												fixed, always visible!</div>
										</div>
									</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="widget-content p-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left mr-3">
											<div class="switch has-switch switch-container-class"
												data-class="fixed-sidebar">
												<div class="switch-animate switch-on">
													<input type="checkbox" checked data-toggle="toggle"
														data-onstyle="success">
												</div>
											</div>
										</div>
										<div class="widget-content-left">
											<div class="widget-heading">Fixed Sidebar</div>
											<div class="widget-subheading">Makes the sidebar left
												fixed, always visible!</div>
										</div>
									</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="widget-content p-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left mr-3">
											<div class="switch has-switch switch-container-class"
												data-class="fixed-footer">
												<div class="switch-animate switch-off">
													<input type="checkbox" data-toggle="toggle"
														data-onstyle="success">
												</div>
											</div>
										</div>
										<div class="widget-content-left">
											<div class="widget-heading">Fixed Footer</div>
											<div class="widget-subheading">Makes the app footer
												bottom fixed, always visible!</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<h3 class="themeoptions-heading">
						<div>Header Options</div>
						<button type="button"
							class="btn-pill btn-shadow btn-wide ml-auto btn btn-focus btn-sm switch-header-cs-class"
							data-class="">Restore Default</button>
					</h3>
					<div class="p-3">
						<ul class="list-group">
							<li class="list-group-item">
								<h5 class="pb-2">Choose Color Scheme</h5>
								<div class="theme-settings-swatches">
									<div class="swatch-holder bg-primary switch-header-cs-class"
										data-class="bg-primary header-text-light"></div>
									<div class="swatch-holder bg-secondary switch-header-cs-class"
										data-class="bg-secondary header-text-light"></div>
									<div class="swatch-holder bg-success switch-header-cs-class"
										data-class="bg-success header-text-dark"></div>
									<div class="swatch-holder bg-info switch-header-cs-class"
										data-class="bg-info header-text-dark"></div>
									<div class="swatch-holder bg-warning switch-header-cs-class"
										data-class="bg-warning header-text-dark"></div>
									<div class="swatch-holder bg-danger switch-header-cs-class"
										data-class="bg-danger header-text-light"></div>
									<div class="swatch-holder bg-light switch-header-cs-class"
										data-class="bg-light header-text-dark"></div>
									<div class="swatch-holder bg-dark switch-header-cs-class"
										data-class="bg-dark header-text-light"></div>
									<div class="swatch-holder bg-focus switch-header-cs-class"
										data-class="bg-focus header-text-light"></div>
									<div class="swatch-holder bg-alternate switch-header-cs-class"
										data-class="bg-alternate header-text-light"></div>
									<div class="divider"></div>
									<div
										class="swatch-holder bg-vicious-stance switch-header-cs-class"
										data-class="bg-vicious-stance header-text-light"></div>
									<div
										class="swatch-holder bg-midnight-bloom switch-header-cs-class"
										data-class="bg-midnight-bloom header-text-light"></div>
									<div class="swatch-holder bg-night-sky switch-header-cs-class"
										data-class="bg-night-sky header-text-light"></div>
									<div
										class="swatch-holder bg-slick-carbon switch-header-cs-class"
										data-class="bg-slick-carbon header-text-light"></div>
									<div class="swatch-holder bg-asteroid switch-header-cs-class"
										data-class="bg-asteroid header-text-light"></div>
									<div class="swatch-holder bg-royal switch-header-cs-class"
										data-class="bg-royal header-text-light"></div>
									<div class="swatch-holder bg-warm-flame switch-header-cs-class"
										data-class="bg-warm-flame header-text-dark"></div>
									<div class="swatch-holder bg-night-fade switch-header-cs-class"
										data-class="bg-night-fade header-text-dark"></div>
									<div
										class="swatch-holder bg-sunny-morning switch-header-cs-class"
										data-class="bg-sunny-morning header-text-dark"></div>
									<div
										class="swatch-holder bg-tempting-azure switch-header-cs-class"
										data-class="bg-tempting-azure header-text-dark"></div>
									<div class="swatch-holder bg-amy-crisp switch-header-cs-class"
										data-class="bg-amy-crisp header-text-dark"></div>
									<div class="swatch-holder bg-heavy-rain switch-header-cs-class"
										data-class="bg-heavy-rain header-text-dark"></div>
									<div class="swatch-holder bg-mean-fruit switch-header-cs-class"
										data-class="bg-mean-fruit header-text-dark"></div>
									<div
										class="swatch-holder bg-malibu-beach switch-header-cs-class"
										data-class="bg-malibu-beach header-text-light"></div>
									<div class="swatch-holder bg-deep-blue switch-header-cs-class"
										data-class="bg-deep-blue header-text-dark"></div>
									<div class="swatch-holder bg-ripe-malin switch-header-cs-class"
										data-class="bg-ripe-malin header-text-light"></div>
									<div
										class="swatch-holder bg-arielle-smile switch-header-cs-class"
										data-class="bg-arielle-smile header-text-light"></div>
									<div class="swatch-holder bg-plum-plate switch-header-cs-class"
										data-class="bg-plum-plate header-text-light"></div>
									<div
										class="swatch-holder bg-happy-fisher switch-header-cs-class"
										data-class="bg-happy-fisher header-text-dark"></div>
									<div
										class="swatch-holder bg-happy-itmeo switch-header-cs-class"
										data-class="bg-happy-itmeo header-text-light"></div>
									<div
										class="swatch-holder bg-mixed-hopes switch-header-cs-class"
										data-class="bg-mixed-hopes header-text-light"></div>
									<div
										class="swatch-holder bg-strong-bliss switch-header-cs-class"
										data-class="bg-strong-bliss header-text-light"></div>
									<div class="swatch-holder bg-grow-early switch-header-cs-class"
										data-class="bg-grow-early header-text-light"></div>
									<div class="swatch-holder bg-love-kiss switch-header-cs-class"
										data-class="bg-love-kiss header-text-light"></div>
									<div
										class="swatch-holder bg-premium-dark switch-header-cs-class"
										data-class="bg-premium-dark header-text-light"></div>
									<div
										class="swatch-holder bg-happy-green switch-header-cs-class"
										data-class="bg-happy-green header-text-light"></div>
								</div>
							</li>
						</ul>
					</div>
					<h3 class="themeoptions-heading">
						<div>Sidebar Options</div>
						<button type="button"
							class="btn-pill btn-shadow btn-wide ml-auto btn btn-focus btn-sm switch-sidebar-cs-class"
							data-class="">Restore Default</button>
					</h3>
					<div class="p-3">
						<ul class="list-group">
							<li class="list-group-item">
								<h5 class="pb-2">Choose Color Scheme</h5>
								<div class="theme-settings-swatches">
									<div class="swatch-holder bg-primary switch-sidebar-cs-class"
										data-class="bg-primary sidebar-text-light"></div>
									<div class="swatch-holder bg-secondary switch-sidebar-cs-class"
										data-class="bg-secondary sidebar-text-light"></div>
									<div class="swatch-holder bg-success switch-sidebar-cs-class"
										data-class="bg-success sidebar-text-dark"></div>
									<div class="swatch-holder bg-info switch-sidebar-cs-class"
										data-class="bg-info sidebar-text-dark"></div>
									<div class="swatch-holder bg-warning switch-sidebar-cs-class"
										data-class="bg-warning sidebar-text-dark"></div>
									<div class="swatch-holder bg-danger switch-sidebar-cs-class"
										data-class="bg-danger sidebar-text-light"></div>
									<div class="swatch-holder bg-light switch-sidebar-cs-class"
										data-class="bg-light sidebar-text-dark"></div>
									<div class="swatch-holder bg-dark switch-sidebar-cs-class"
										data-class="bg-dark sidebar-text-light"></div>
									<div class="swatch-holder bg-focus switch-sidebar-cs-class"
										data-class="bg-focus sidebar-text-light"></div>
									<div class="swatch-holder bg-alternate switch-sidebar-cs-class"
										data-class="bg-alternate sidebar-text-light"></div>
									<div class="divider"></div>
									<div
										class="swatch-holder bg-vicious-stance switch-sidebar-cs-class"
										data-class="bg-vicious-stance sidebar-text-light"></div>
									<div
										class="swatch-holder bg-midnight-bloom switch-sidebar-cs-class"
										data-class="bg-midnight-bloom sidebar-text-light"></div>
									<div class="swatch-holder bg-night-sky switch-sidebar-cs-class"
										data-class="bg-night-sky sidebar-text-light"></div>
									<div
										class="swatch-holder bg-slick-carbon switch-sidebar-cs-class"
										data-class="bg-slick-carbon sidebar-text-light"></div>
									<div class="swatch-holder bg-asteroid switch-sidebar-cs-class"
										data-class="bg-asteroid sidebar-text-light"></div>
									<div class="swatch-holder bg-royal switch-sidebar-cs-class"
										data-class="bg-royal sidebar-text-light"></div>
									<div
										class="swatch-holder bg-warm-flame switch-sidebar-cs-class"
										data-class="bg-warm-flame sidebar-text-dark"></div>
									<div
										class="swatch-holder bg-night-fade switch-sidebar-cs-class"
										data-class="bg-night-fade sidebar-text-dark"></div>
									<div
										class="swatch-holder bg-sunny-morning switch-sidebar-cs-class"
										data-class="bg-sunny-morning sidebar-text-dark"></div>
									<div
										class="swatch-holder bg-tempting-azure switch-sidebar-cs-class"
										data-class="bg-tempting-azure sidebar-text-dark"></div>
									<div class="swatch-holder bg-amy-crisp switch-sidebar-cs-class"
										data-class="bg-amy-crisp sidebar-text-dark"></div>
									<div
										class="swatch-holder bg-heavy-rain switch-sidebar-cs-class"
										data-class="bg-heavy-rain sidebar-text-dark"></div>
									<div
										class="swatch-holder bg-mean-fruit switch-sidebar-cs-class"
										data-class="bg-mean-fruit sidebar-text-dark"></div>
									<div
										class="swatch-holder bg-malibu-beach switch-sidebar-cs-class"
										data-class="bg-malibu-beach sidebar-text-light"></div>
									<div class="swatch-holder bg-deep-blue switch-sidebar-cs-class"
										data-class="bg-deep-blue sidebar-text-dark"></div>
									<div
										class="swatch-holder bg-ripe-malin switch-sidebar-cs-class"
										data-class="bg-ripe-malin sidebar-text-light"></div>
									<div
										class="swatch-holder bg-arielle-smile switch-sidebar-cs-class"
										data-class="bg-arielle-smile sidebar-text-light"></div>
									<div
										class="swatch-holder bg-plum-plate switch-sidebar-cs-class"
										data-class="bg-plum-plate sidebar-text-light"></div>
									<div
										class="swatch-holder bg-happy-fisher switch-sidebar-cs-class"
										data-class="bg-happy-fisher sidebar-text-dark"></div>
									<div
										class="swatch-holder bg-happy-itmeo switch-sidebar-cs-class"
										data-class="bg-happy-itmeo sidebar-text-light"></div>
									<div
										class="swatch-holder bg-mixed-hopes switch-sidebar-cs-class"
										data-class="bg-mixed-hopes sidebar-text-light"></div>
									<div
										class="swatch-holder bg-strong-bliss switch-sidebar-cs-class"
										data-class="bg-strong-bliss sidebar-text-light"></div>
									<div
										class="swatch-holder bg-grow-early switch-sidebar-cs-class"
										data-class="bg-grow-early sidebar-text-light"></div>
									<div class="swatch-holder bg-love-kiss switch-sidebar-cs-class"
										data-class="bg-love-kiss sidebar-text-light"></div>
									<div
										class="swatch-holder bg-premium-dark switch-sidebar-cs-class"
										data-class="bg-premium-dark sidebar-text-light"></div>
									<div
										class="swatch-holder bg-happy-green switch-sidebar-cs-class"
										data-class="bg-happy-green sidebar-text-light"></div>
								</div>
							</li>
						</ul>
					</div>
					<h3 class="themeoptions-heading">
						<div>Main Content Options</div>
						<button type="button"
							class="btn-pill btn-shadow btn-wide ml-auto active btn btn-focus btn-sm">Restore
							Default</button>
					</h3>
					<div class="p-3">
						<ul class="list-group">
							<li class="list-group-item">
								<h5 class="pb-2">Page Section Tabs</h5>
								<div class="theme-settings-swatches">
									<div role="group" class="mt-2 btn-group">
										<button type="button"
											class="btn-wide btn-shadow btn-primary btn btn-secondary switch-theme-class"
											data-class="body-tabs-line">Line</button>
										<button type="button"
											class="btn-wide btn-shadow btn-primary active btn btn-secondary switch-theme-class"
											data-class="body-tabs-shadow">Shadow</button>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="app-main">
		<div class="app-sidebar sidebar-shadow">
			<div class="app-header__logo">
				<div class="logo-src"></div>
				<div class="header__pane ml-auto">
					<div>
						<button type="button"
							class="hamburger close-sidebar-btn hamburger--elastic"
							data-class="closed-sidebar">
							<span class="hamburger-box"> <span class="hamburger-inner"></span>
							</span>
						</button>
					</div>
				</div>
			</div>
			<div class="app-header__mobile-menu">
				<div>
					<button type="button"
						class="hamburger hamburger--elastic mobile-toggle-nav">
						<span class="hamburger-box"> <span class="hamburger-inner"></span>
						</span>
					</button>
				</div>
			</div>
			<div class="app-header__menu">
				<span>
					<button type="button"
						class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
						<span class="btn-icon-wrapper"> <i
							class="fa fa-ellipsis-v fa-w-6"></i>
						</span>
					</button>
				</span>
			</div>
			<div class="scrollbar-sidebar">
				<div class="app-sidebar__inner">
					<ul class="vertical-nav-menu">
						<li class="app-sidebar__heading">Royal Frontier</li>
						<li><a href="jsp/EditMenus.jsp" class="mm-active"> <i
								class="metismenu-icon"></i>Edit Menu
						</a></li>
						<li><a href="jsp/AdminManageOrder.jsp" class="mm-active"> <i
								class="metismenu-icon"></i>Manage Order
						</a></li>
						<li><a href="jsp/ViewReservation.jsp" class="mm-active"> <i
								class="metismenu-icon"></i>View Reservation
						</a></li>
						<li><a href="jsp/Index.jsp" class="mm-active"> <i
								class="metismenu-icon"> </i>Logout
						</a></li>
						<li>
					</ul>
				</div>
			</div>
		</div>
		<div class="app-main__outer">
			<div class="app-main__inner">
				<div class="app-page-title">
					<div class="page-title-wrapper">
						<div class="page-title-heading">
							<!-- <div class="page-title-icon">
										add logo here
</div> -->
							<div>
								Royal Frontier Dashboard
<!-- 								<div class="page-title-subheading">"Empowering Restaurant -->
<!-- 									Management Excellence"</div> -->
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-xl-4">
							<div class="card mb-3 widget-content bg-midnight-bloom">
								<div class="widget-content-wrapper text-white">
									<div class="widget-content-left">
										<div class="widget-heading">Daily Sales</div>
										<div class="widget-subheading">Daily expenses</div>
									</div>
									<div class="widget-content-right">
										<div class="widget-numbers text-white">
											<span>
												<%
												out.println(String.format("RM %.2f", daily));
												%>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xl-4">
							<div class="card mb-3 widget-content bg-midnight-bloom">
								<div class="widget-content-wrapper text-white">
									<div class="widget-content-left">
										<div class="widget-heading">Week Sales</div>
										<div class="widget-subheading">Week expenses</div>
									</div>
									<div class="widget-content-right">
										<div class="widget-numbers text-white">
											<span>
												<%
												out.println(String.format("RM %.2f", week));
												%>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xl-4">
							<div class="card mb-3 widget-content bg-grow-early">
								<div class="widget-content-wrapper text-white">
									<div class="widget-content-left">
										<div class="widget-heading">Month Sales</div>
										<div class="widget-subheading">Month expenses</div>
									</div>
									<div class="widget-content-right">
										<div class="widget-numbers text-white">
											<span>
												<%
												out.println(String.format("RM %.2f", month));
												%>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-xl-4">
							<div class="card mb-3 widget-content bg-grow-early">
								<div class="widget-content-wrapper text-white">
									<div class="widget-content-left">
										<div class="widget-heading">Year Sales</div>
										<div class="widget-subheading">Year expenses</div>
									</div>
									<div class="widget-content-right">
										<div class="widget-numbers text-white">
											<span>
												<%
												out.println(String.format("RM %.2f", year));
												%>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xl-4">
							<div class="card mb-3 widget-content bg-premium-dark">
								<div class="widget-content-wrapper text-white">
									<div class="widget-content-left">
										<div class="widget-heading">Lifetime Sales</div>
										<div class="widget-subheading">Lifetime expenses</div>
									</div>
									<div class="widget-content-right">
										<div class="widget-numbers text-warning">
											<span>
												<%
												out.println(String.format("RM %.2f", lifetime));
												%>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="row">
					<div class="col-md-12">
						<div class="main-card mb-3 card">
							<div class="card-header">
								Best Seller Menu
								<div class="btn-actions-pane-right">
									<div role="group" class="btn-group-sm btn-group">
										<button class="active btn btn-focus">Last Week</button>
										<button class="btn btn-focus">All Month</button>
									</div>
								</div>
							</div>
							<div class="table-responsive">
								<table
									class="align-middle mb-0 table table-borderless table-striped table-hover">
									<thead>
										<tr>
											<th class="text-center">#</th>
											<th>Name</th>
											<th class="text-center">Price</th>
											<th class="text-center">Total Order</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-center text-muted">#345</td>
											<td>
												<div class="widget-content p-0">
													<div class="widget-content-wrapper">
														<div class="widget-content-left mr-3">
															<div class="widget-content-left">
																<img width="40" class="rounded-circle"
																	src="assets/images/avatars/4.jpg" alt="">
															</div>
														</div>
														<div class="widget-content-left flex2">
															<div class="widget-heading">Chicken Wings</div>
															<div class="widget-subheading opacity-7">Sweet and
																Spicy wings</div>
														</div>
													</div>
												</div>
											</td>
											<td class="text-center">RM32</td>
											<td class="text-center">25</td>
										</tr>
										<tr>
											<td class="text-center text-muted">#347</td>
											<td>
												<div class="widget-content p-0">
													<div class="widget-content-wrapper">
														<div class="widget-content-left mr-3">
															<div class="widget-content-left">
																<img width="40" class="rounded-circle"
																	src="assets/images/avatars/3.jpg" alt="">
															</div>
														</div>
														<div class="widget-content-left flex2">
															<div class="widget-heading">Shrimp Cocktil</div>
															<div class="widget-subheading opacity-7">Prawn
																sweet and spicy</div>
														</div>
													</div>
												</div>
											</td>
											<td class="text-center">RM32</td>
											<td class="text-center">19</td>
										</tr>
										<tr>
											<td class="text-center text-muted">#321</td>
											<td>
												<div class="widget-content p-0">
													<div class="widget-content-wrapper">
														<div class="widget-content-left mr-3">
															<div class="widget-content-left">
																<img width="40" class="rounded-circle"
																	src="assets/images/avatars/2.jpg" alt="">
															</div>
														</div>
														<div class="widget-content-left flex2">
															<div class="widget-heading">Lasagna</div>
															<div class="widget-subheading opacity-7">Baked with
																love</div>
														</div>
													</div>
												</div>
											</td>
											<td class="text-center">RM32</td>
											<td class="text-center">15</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div> -->
				<div class="app-wrapper-footer">
					<div class="app-footer">
						<div class="app-footer__inner">
							<div class="app-footer-right">
								<ul class="nav">
									<li class="nav-item"><a href="javascript:void(0);"
										class="nav-link"> Royal Frontier Admin 2023 © </a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
		</div>
	</div>
	<script type="text/javascript"
		src="https://demo.dashboardpack.com/architectui-html-free/assets/scripts/main.js"></script>
</body>
</html>


