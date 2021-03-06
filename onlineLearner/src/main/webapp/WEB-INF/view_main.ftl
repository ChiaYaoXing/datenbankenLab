<html>
<head><title>Welcome To Online Learner!</title></head>



<style>

:root {

  /* Tile Dimensions */
  --carousel-tile-spacing: 10px;
  --carousel-tile-width:   300px;
  --carousel-tile-height:  calc(var(--carousel-tile-width) / (16 / 9));

  /* Growth Factor */
  --carousel-growth-factor: 1.5;

  /* Fade to Opacity */
  --carousel-fade-opacity:   0.25;
  --carousel-normal-opacity: 1;

  /* Automatic Offsets - DO NOT ALTER */
  --carousel-offset-left:  calc(-1 * (var(--carousel-tile-width) * (var(--carousel-growth-factor) - 1) / 2));
  --carousel-offset-right: calc(var(--carousel-tile-width) * (var(--carousel-growth-factor) - 1));

  /* Transition Speeds */
  --carousel-transition-1: 1s;
  --carousel-transition-2: 0.5s;
  --carousel-transition-3: 0.3s;

}

/* Carousel Container */
.carousel {
      margin: 0;
      box-sizing: border-box;
      width: 100%;
      overflow-x: auto;
      overflow-y: hidden;
}

/* Carousel Row */
.carousel-row {
      white-space: nowrap;
      margin-top: calc((var(--carousel-tile-height) * (var(--carousel-growth-factor) - 1)) / 2);
      margin-bottom: calc((var(--carousel-tile-height) * (var(--carousel-growth-factor) - 1)) / 2);
      margin-left: calc((var(--carousel-tile-width) * (var(--carousel-growth-factor) - 1)) / 2);
      margin-right: calc((var(--carousel-tile-width) * (var(--carousel-growth-factor) - 1)) / 2);
      transition: var(--carousel-transition-2);
}

/* Content Tile */
.carousel-tile {
      position: relative;
      display: inline-block;
      width: var(--carousel-tile-width);
      height: var(--carousel-tile-height);
      margin-right: var(--carousel-tile-spacing);
      transition: var(--carousel-transition-2);
      -webkit-transform-origin: center left;
      transform-origin: center left;
      cursor: pointer;
      cursor: hand;
}

/* Add Extra Margin to Last Carousel Tile */
.carousel-tile:last-of-type {
      margin-right: calc(var(--carousel-tile-width)/2);
}

/* Ensure All Elements Inside Tile are Block */
.carousel-tile * {
      display: block;
}

/* Carousel Row on Hover */
.carousel-row:hover {
      -webkit-transform: translate3d(var(--carousel-offset-left), 0, 0);
      transform: translate3d(var(--carousel-offset-left), 0, 0);
}

/* Content Tile on Carousel Row Hover */
.carousel-row:hover .carousel-tile {
      opacity: var(--carousel-fade-opacity);
}

/* Content Tile on Hover on Carousel Row Hover */
.carousel-row:hover .carousel-tile:hover {
      -webkit-transform: scale(var(--carousel-growth-factor));
      transform: scale(var(--carousel-growth-factor));
      opacity: var(--carousel-normal-opacity);

}

/* Content Tile on Hover */
.carousel-tile:hover ~ .carousel-tile {
      -webkit-transform: translate3d(var(--carousel-offset-right), 0, 0);
      transform: translate3d(var(--carousel-offset-right), 0, 0);
      box-shadow: 10px 10px 5px grey;
}

.btn{
    width: 100%;
    height: 100%;
    border-radius: 4%;
    background: rgba(0, 0, 0, 0.02);
    cursor: hand;
}





</style>

<body>
<div class ="app">
    <h1 class="maintitle"> OnlineLearner </h1>
    <h3 class="subtitle"> Meine Kurse </h3>
    <div class="carousel">
    <div class="carousel-row">
        <#list courses as course>
            <div class = "carousel-tile">
                <form action="view_course" method="get">
                <button class="btn" type="submit">
                <input type="hidden" name="kid" value=${course.kid}>
                <input type="hidden" name="isRegistered" value="true">
                <h4>${course.kid}  ${course.name}</h4>
                <p>${course.description}</p>
                </button>
                </form>
            </div>
        </#list>
        </div>
    </div>
    <h3 class="subtitle"> Verfügbare Kurse </h3>
    <div class="carousel">
    <div class="carousel-row">
        <#list availableCourses as aCourse>
            <div class="carousel-tile">
            <form action="view_course" method="get">
                <button class="btn" type="submit">
                <input type="hidden" name="kid" value=${aCourse.kid}>
                <input type="hidden" name="isRegistered" value="false">
                <h4>${aCourse.kid}  ${aCourse.name}</h4>
                <p>${aCourse.description}</p>
                </button>
                </form>
            </div>
        </#list>

    </div>
    </div>

</div>
<a href="new_course">Neu Erstellen</a>

</body>
</html>