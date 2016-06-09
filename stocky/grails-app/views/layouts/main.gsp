<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'deerwalk-logo.png')}" type="image/x-icon">
        <link rel="stylesheet" href="${resource(dir: 'bootstrap-3.3.6-dist/css',file: 'bootstrap.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css',file: 'style.css')}" type="text/css">
		<script type="text/javascript" src="${resource(dir: 'js',file: 'app-script.js')}"></script>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'engine0',file: 'style.css')}">
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css',file: 'jquery.dataTables.min.css')}">
		<script type="text/javascript" src="${resource(dir: 'js',file: 'jquery-1.12.0.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'bootstrap-3.3.6-dist/js',file: 'bootstrap.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js',file: 'jquery.dataTables.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js',file: 'app-script.js')}"></script>

	<g:layoutHead/>
		<g:javascript library="application"/>		
		<r:layoutResources />
	</head>
	<body>
		<div>
            <g:render template="/layouts/header"/>
        </div>
		<g:layoutBody/>
		<div>
            <g:render template="/layouts/footer"/>
        </div>
		<r:layoutResources />
	</body>
</html>
