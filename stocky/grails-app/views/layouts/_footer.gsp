<style type="text/css">
.footer{
    width: 100%;
    position: absolute;
    background-color: ${session.getAttribute("footer_color")};
    bottom: 0;
    text-align: center;
    min-height: 45px;
    padding: 1%;
}

.footer p{
    color: ${session.getAttribute("footer_text_color")};
    position: relative;
    margin: 0px auto;
}

</style>

<div style="height: 50px; position: relative;"></div>
<footer class="footer">
    <div align="center" class="container">
        <p>@Stocky</p>
    </div>
</footer>