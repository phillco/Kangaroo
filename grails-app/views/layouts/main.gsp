<%@ page import="grails.util.Environment; kangaroo.Term" %>
<!DOCTYPE html>
<html xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <!-- Random number: ${new Random().nextInt(100)} -->
    <script type="text/javascript">var _sf_startpt = (new Date()).getTime()</script>
    <title><g:layoutTitle default="Kangaroo"/></title>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'app3.css')}"/>

    %{-- Facebook terms! Oh boy! --}%
    <meta name="title" content="Kangaroo"/>
    <meta name="description" content="Browse Austin College courses in style!"/>
    <meta property="og:url" content="http://kangaroo.austincollege.edu/"/>
    <meta property="og:title" content="Kangaroo"/>
    <meta property="og:type" content="website"/>
    <meta property="og:image" content="http://kangaroo.austincollege.edu/images/app_logo.png"/>
    <meta property="og:site_name" content="Kangaroo"/>
    <meta property="og:description"
          content="Browse Austin College courses in style!"/>
    <meta property="fb:admins" content="789953992"/>
    <meta property="fb:page_id" content="316033641745190"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

    %{-- Set some global javascript variables while we still have access to the grails closures. --}%
    <script type="text/javascript">
        var contextPath = "${request.contextPath}";
    </script>

    <g:layoutHead/>

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    <style type="text/css">
        /* Override some defaults */
    html, body {
        background-color: #eee;
    }

    body {
        padding-top: 10px;
    }

    .container > footer p {
        text-align: center; /* center align it with the container */
    }

    .container {

    }

        /* The white background content wrapper */
    .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; /* negative indent the amount of the padding to maintain the grid system */
        -webkit-border-radius: 0 0 6px 6px;
        -moz-border-radius: 0 0 6px 6px;
        border-radius: 0 0 6px 6px;
        -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
        -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
        box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
    }

        /* Page header tweaks */
    .page-header {
        background-color: #f5f5f5;
        padding: 20px 20px 10px;
        margin: -20px -20px 20px;
    }

        /* Styles you shouldn't keep as they are for displaying this base example only */
    .content .span10,
    .content .span4 {
        min-height: 500px;
    }

        /* Give a quick and non-cross-browser friendly divider */
    .content .span4 {
        margin-left: 0;
        padding-left: 19px;
        border-left: 1px solid #eee;
    }

    .topbar .btn {
        border: 0;
    }
    </style>

    <g:javascript src="cookies.js"/>
</head>

<body>
<div class="container">

    <div class="content">
        <div class="page-header">
            <g:link controller="home"><img src="${resource(dir: 'images', file: 'app_logo.png')}" alt="Kangaroo"
                                           height="58px" width="290px" border="0"/></g:link>
        </div>

        <div class="row">
            <div class="span16">
                <g:layoutBody/>
            </div>

        </div>


        <g:if test="${Environment.current == Environment.PRODUCTION}">
            <div id="promotion">
                <h3>Like Kangaroo? Share it with your friends.</h3>

                <div id="fb-root"></div>
                <fb:like href="http://csac.austincollege.edu/kangaroo/" layout="standard" show_faces="true" width="650"
                         height="35" action="like" data-send="true"
                         colorscheme="light" font="trebuchet ms" allowTransparency="true"></fb:like>
            </div>
        </g:if>
    </div>

    <footer>
        <p>Version 1.5 &middot; Created by <a
                href="https://www.facebook.com/phillip.cohen">Phillip Tiberius Cohen</a> &middot; <a
                href="mailto:cs@austincollege.edu">Send feedback to cs@austincollege.edu</a></p>
    </footer>

</div> <!-- /container -->

<g:if test="${Environment.current == Environment.PRODUCTION}">
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-26802912-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

    </script>
    <script type="text/javascript">
        // prevent jQuery from appending cache busting string to the end of the FeatureLoader URL
        var cache = jQuery.ajaxSettings.cache;
        jQuery.ajaxSettings.cache = true;
        // Load FeatureLoader asynchronously. Once loaded, we execute Facebook init

        jQuery.getScript('http://connect.facebook.net/en_US/all.js', function () {
            FB.init({appId:'your_app_id-optional', status:true, cookie:true, xfbml:true});
        });
        // just Restore jQuery caching setting
        jQuery.ajaxSettings.cache = cache;
    </script>

    <!-- start Mixpanel --><script type="text/javascript">var mpq = [];
mpq.push(["init", "102753bbc8bcef0e34932d5f829ed00d"]);
(function () {
    var b, a, e, d, c;
    b = document.createElement("script");
    b.type = "text/javascript";
    b.async = true;
    b.src = (document.location.protocol === "https:" ? "https:" : "http:") + "//api.mixpanel.com/site_media/js/api/mixpanel.js";
    a = document.getElementsByTagName("script")[0];
    a.parentNode.insertBefore(b, a);
    e = function (f) {
        return function () {
            mpq.push([f].concat(Array.prototype.slice.call(arguments, 0)))
        }
    };
    d = ["init", "track", "track_links", "track_forms", "register", "register_once", "identify", "name_tag", "set_config"];
    for (c = 0; c < d.length; c++) {
        mpq[d[c]] = e(d[c])
    }
})();
</script><!-- end Mixpanel -->
</g:if>
</body>

<script type="text/javascript">
    var cookie = getCookie('prof_id');
    if (cookie) {
        mpq.name_tag(cookie);
        mpq.identify(cookie);
    }
</script>
</html>