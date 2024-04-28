<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title><tiles:getAsString name="title" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.83.1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>

<style type="text/css">
.blockquote {
	padding: 20px;
	box-shadow: inset 0 -3em 3em rgba(0, 0, 0, 0.1), 0 0 0 2px
		rgb(255, 255, 255), 0.3em 0.3em 1em rgba(0, 0, 0, 0.3);
}

.imageHeight {
	height: 320px;
}

.linkSize {
	font-size: 14px;
}

body {
	min-height: 100vh;
	min-height: -webkit-fill-available;
}

html {
	height: -webkit-fill-available;
}

main {
	display: flex;
	flex-wrap: nowrap;
	height: 100vh;
	height: -webkit-fill-available;
	max-height: 100vh;
	overflow-x: auto;
	overflow-y: hidden;
}

.b-example-divider {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.bi {
	vertical-align: -.125em;
	pointer-events: none;
	fill: currentColor;
}

.dropdown-toggle {
	outline: 0;
}

.nav-flush .nav-link {
	border-radius: 0;
}

.btn-toggle {
	display: inline-flex;
	align-items: center;
	padding: .25rem .5rem;
	font-weight: 600;
	color: rgba(0, 0, 0, .65);
	background-color: transparent;
	border: 0;
}

.btn-toggle:hover, .btn-toggle:focus {
	color: rgba(0, 0, 0, .85);
	background-color: #d2f4ea;
}

.btn-toggle::before {
	width: 1.25em;
	line-height: 0;
	content:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
	transition: transform .35s ease;
	transform-origin: .5em 50%;
}

.btn-toggle[aria-expanded="true"] {
	color: rgba(0, 0, 0, .85);
}

.btn-toggle[aria-expanded="true"]::before {
	transform: rotate(90deg);
}

.btn-toggle-nav a {
	display: inline-flex;
	padding: .1875rem .5rem;
	margin-top: .125rem;
	margin-left: 1.25rem;
	text-decoration: none;
}

.btn-toggle-nav a:hover, .btn-toggle-nav a:focus {
	background-color: #d2f4ea;
}

.scrollarea {
	overflow-y: auto;
}

.fw-semibold {
	font-weight: 600;
}

.lh-tight {
	line-height: 1.25;
}
</style>



</head>
<body>

	<tiles:insertAttribute name="header" />
	
		
		
			<tiles:insertAttribute name="body" />
		
	

			<tiles:insertAttribute name="footer" />
</body>
</html>