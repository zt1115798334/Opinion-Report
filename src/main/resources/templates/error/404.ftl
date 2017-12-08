<!DOCTYPE html>
<html class=" -webkit-">
<head>

    <style>
        button, hr, input {
            overflow: visible
        }

        audio, canvas, progress, video {
            display: inline-block
        }

        progress, sub, sup {
            vertical-align: baseline
        }

        html {
            font-family: sans-serif;
            line-height: 1.15;
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%
        }

        body {
            margin: 0
        }

        menu, article, aside, details, footer, header, nav, section {
            display: block
        }

        h1 {
            font-size: 2em;
            margin: .67em 0
        }

        figcaption, figure, main {
            display: block
        }

        figure {
            margin: 1em 40px
        }

        hr {
            box-sizing: content-box;
            height: 0
        }

        code, kbd, pre, samp {
            font-family: monospace, monospace;
            font-size: 1em
        }

        a {
            background-color: transparent;
            -webkit-text-decoration-skip: objects
        }

        a:active, a:hover {
            outline-width: 0
        }

        abbr[title] {
            border-bottom: none;
            text-decoration: underline;
            text-decoration: underline dotted
        }

        b, strong {
            font-weight: bolder
        }

        dfn {
            font-style: italic
        }

        mark {
            background-color: #ff0;
            color: #000
        }

        small {
            font-size: 80%
        }

        sub, sup {
            font-size: 75%;
            line-height: 0;
            position: relative
        }

        sub {
            bottom: -.25em
        }

        sup {
            top: -.5em
        }

        audio:not([controls]) {
            display: none;
            height: 0
        }

        img {
            border-style: none
        }

        svg:not(:root) {
            overflow: hidden
        }

        button, input, optgroup, select, textarea {
            font-family: sans-serif;
            font-size: 100%;
            line-height: 1.15;
            margin: 0
        }

        button, input {
        }

        button, select {
            text-transform: none
        }

        [type=submit], [type=reset], button, html [type=button] {
            -webkit-appearance: button
        }

        [type=button]::-moz-focus-inner, [type=reset]::-moz-focus-inner, [type=submit]::-moz-focus-inner, button::-moz-focus-inner {
            border-style: none;
            padding: 0
        }

        [type=button]:-moz-focusring, [type=reset]:-moz-focusring, [type=submit]:-moz-focusring, button:-moz-focusring {
            outline: ButtonText dotted 1px
        }

        fieldset {
            border: 1px solid silver;
            margin: 0 2px;
            padding: .35em .625em .75em
        }

        legend {
            box-sizing: border-box;
            color: inherit;
            display: table;
            max-width: 100%;
            padding: 0;
            white-space: normal
        }

        progress {
        }

        textarea {
            overflow: auto
        }

        [type=checkbox], [type=radio] {
            box-sizing: border-box;
            padding: 0
        }

        [type=number]::-webkit-inner-spin-button, [type=number]::-webkit-outer-spin-button {
            height: auto
        }

        [type=search] {
            -webkit-appearance: textfield;
            outline-offset: -2px
        }

        [type=search]::-webkit-search-cancel-button, [type=search]::-webkit-search-decoration {
            -webkit-appearance: none
        }

        ::-webkit-file-upload-button {
            -webkit-appearance: button;
            font: inherit
        }

        summary {
            display: list-item
        }

        [hidden], template {
            display: none
        }

        /*# sourceMappingURL=normalize.min.css.map */
    </style>

    <style class="cp-pen-styles">
        body {
            background: #2196F3;
        }

        body h1 {
            position: fixed;
            text-align: center;
            bottom: 10px;
            left: 30px;
            color: white;
            font-size: 20px;
            font-family: Roboto;
            font-weight: normal;
            z-index: 999;
        }

        body h1 span {
            font-size: 15px;
            font-weight: lighter;
        }

        body h1 a {
            color: white;
            font-size: 15px;
            padding: 0 30px;
        }

        #notFound {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translateY(-50%) translateX(-50%) scale(1.2);
            width: 80%;
            height: auto;
        }
    </style>
</head>
<body id="body1">


<script>

    /**
     * @license
     * pixi.js - v2.2.5
     * Copyright (c) 2012-2014, Mat Groves
     * http://goodboydigital.com/
     *
     * Compiled: 2015-01-27
     *
     * pixi.js is licensed under the MIT License.
     * http://www.opensource.org/licenses/mit-license.php
     */
    (function () {
        var a = this, b = b || {};
        b.WEBGL_RENDERER = 0, b.CANVAS_RENDERER = 1, b.VERSION = "v2.2.5", b.blendModes = {
            NORMAL: 0,
            ADD: 1,
            MULTIPLY: 2,
            SCREEN: 3,
            OVERLAY: 4,
            DARKEN: 5,
            LIGHTEN: 6,
            COLOR_DODGE: 7,
            COLOR_BURN: 8,
            HARD_LIGHT: 9,
            SOFT_LIGHT: 10,
            DIFFERENCE: 11,
            EXCLUSION: 12,
            HUE: 13,
            SATURATION: 14,
            COLOR: 15,
            LUMINOSITY: 16
        }, b.scaleModes = {
            DEFAULT: 0,
            LINEAR: 0,
            NEAREST: 1
        }, b._UID = 0, "undefined" != typeof Float32Array ? (b.Float32Array = Float32Array, b.Uint16Array = Uint16Array, b.Uint32Array = Uint32Array, b.ArrayBuffer = ArrayBuffer) : (b.Float32Array = Array, b.Uint16Array = Array), b.INTERACTION_FREQUENCY = 30, b.AUTO_PREVENT_DEFAULT = !0, b.PI_2 = 2 * Math.PI, b.RAD_TO_DEG = 180 / Math.PI, b.DEG_TO_RAD = Math.PI / 180, b.RETINA_PREFIX = "@2x", b.dontSayHello = !1, b.defaultRenderOptions = {
            view: null,
            transparent: !1,
            antialias: !1,
            preserveDrawingBuffer: !1,
            resolution: 1,
            clearBeforeRender: !0,
            autoResize: !1
        }, b.sayHello = function (a) {
            if (!b.dontSayHello) {
                if (navigator.userAgent.toLowerCase().indexOf("chrome") > -1) {
                    var c = ["%c %c %c Pixi.js " + b.VERSION + " - " + a + "  %c  %c  http://www.pixijs.com/  %c %c ♥%c♥%c♥ ", "background: #ff66a5", "background: #ff66a5", "color: #ff66a5; background: #030307;", "background: #ff66a5", "background: #ffc3dc", "background: #ff66a5", "color: #ff2424; background: #fff", "color: #ff2424; background: #fff", "color: #ff2424; background: #fff"];
                    console.log.apply(console, c)
                } else window.console && console.log("Pixi.js " + b.VERSION + " - http://www.pixijs.com/");
                b.dontSayHello = !0
            }
        }, b.Point = function (a, b) {
            this.x = a || 0, this.y = b || 0
        }, b.Point.prototype.clone = function () {
            return new b.Point(this.x, this.y)
        }, b.Point.prototype.set = function (a, b) {
            this.x = a || 0, this.y = b || (0 !== b ? this.x : 0)
        }, b.Point.prototype.constructor = b.Point, b.Rectangle = function (a, b, c, d) {
            this.x = a || 0, this.y = b || 0, this.width = c || 0, this.height = d || 0
        }, b.Rectangle.prototype.clone = function () {
            return new b.Rectangle(this.x, this.y, this.width, this.height)
        }, b.Rectangle.prototype.contains = function (a, b) {
            if (this.width <= 0 || this.height <= 0) return !1;
            var c = this.x;
            if (a >= c && a <= c + this.width) {
                var d = this.y;
                if (b >= d && b <= d + this.height) return !0
            }
            return !1
        }, b.Rectangle.prototype.constructor = b.Rectangle, b.EmptyRectangle = new b.Rectangle(0, 0, 0, 0), b.Polygon = function (a) {
            if (a instanceof Array || (a = Array.prototype.slice.call(arguments)), a[0] instanceof b.Point) {
                for (var c = [], d = 0, e = a.length; e > d; d++) c.push(a[d].x, a[d].y);
                a = c
            }
            this.closed = !0, this.points = a
        }, b.Polygon.prototype.clone = function () {
            var a = this.points.slice();
            return new b.Polygon(a)
        }, b.Polygon.prototype.contains = function (a, b) {
            for (var c = !1, d = this.points.length / 2, e = 0, f = d - 1; d > e; f = e++) {
                var g = this.points[2 * e], h = this.points[2 * e + 1], i = this.points[2 * f],
                        j = this.points[2 * f + 1], k = h > b != j > b && (i - g) * (b - h) / (j - h) + g > a;
                k && (c = !c)
            }
            return c
        }, b.Polygon.prototype.constructor = b.Polygon, b.Circle = function (a, b, c) {
            this.x = a || 0, this.y = b || 0, this.radius = c || 0
        }, b.Circle.prototype.clone = function () {
            return new b.Circle(this.x, this.y, this.radius)
        }, b.Circle.prototype.contains = function (a, b) {
            if (this.radius <= 0) return !1;
            var c = this.x - a, d = this.y - b, e = this.radius * this.radius;
            return c *= c, d *= d, e >= c + d
        }, b.Circle.prototype.getBounds = function () {
            return new b.Rectangle(this.x - this.radius, this.y - this.radius, 2 * this.radius, 2 * this.radius)
        }, b.Circle.prototype.constructor = b.Circle, b.Ellipse = function (a, b, c, d) {
            this.x = a || 0, this.y = b || 0, this.width = c || 0, this.height = d || 0
        }, b.Ellipse.prototype.clone = function () {
            return new b.Ellipse(this.x, this.y, this.width, this.height)
        }, b.Ellipse.prototype.contains = function (a, b) {
            if (this.width <= 0 || this.height <= 0) return !1;
            var c = (a - this.x) / this.width, d = (b - this.y) / this.height;
            return c *= c, d *= d, 1 >= c + d
        }, b.Ellipse.prototype.getBounds = function () {
            return new b.Rectangle(this.x - this.width, this.y - this.height, this.width, this.height)
        }, b.Ellipse.prototype.constructor = b.Ellipse, b.RoundedRectangle = function (a, b, c, d, e) {
            this.x = a || 0, this.y = b || 0, this.width = c || 0, this.height = d || 0, this.radius = e || 20
        }, b.RoundedRectangle.prototype.clone = function () {
            return new b.RoundedRectangle(this.x, this.y, this.width, this.height, this.radius)
        }, b.RoundedRectangle.prototype.contains = function (a, b) {
            if (this.width <= 0 || this.height <= 0) return !1;
            var c = this.x;
            if (a >= c && a <= c + this.width) {
                var d = this.y;
                if (b >= d && b <= d + this.height) return !0
            }
            return !1
        }, b.RoundedRectangle.prototype.constructor = b.RoundedRectangle, b.Matrix = function () {
            this.a = 1, this.b = 0, this.c = 0, this.d = 1, this.tx = 0, this.ty = 0
        }, b.Matrix.prototype.fromArray = function (a) {
            this.a = a[0], this.b = a[1], this.c = a[3], this.d = a[4], this.tx = a[2], this.ty = a[5]
        }, b.Matrix.prototype.toArray = function (a) {
            this.array || (this.array = new b.Float32Array(9));
            var c = this.array;
            return a ? (c[0] = this.a, c[1] = this.b, c[2] = 0, c[3] = this.c, c[4] = this.d, c[5] = 0, c[6] = this.tx, c[7] = this.ty, c[8] = 1) : (c[0] = this.a, c[1] = this.c, c[2] = this.tx, c[3] = this.b, c[4] = this.d, c[5] = this.ty, c[6] = 0, c[7] = 0, c[8] = 1), c
        }, b.Matrix.prototype.apply = function (a, c) {
            return c = c || new b.Point, c.x = this.a * a.x + this.c * a.y + this.tx, c.y = this.b * a.x + this.d * a.y + this.ty, c
        }, b.Matrix.prototype.applyInverse = function (a, c) {
            c = c || new b.Point;
            var d = 1 / (this.a * this.d + this.c * -this.b);
            return c.x = this.d * d * a.x + -this.c * d * a.y + (this.ty * this.c - this.tx * this.d) * d, c.y = this.a * d * a.y + -this.b * d * a.x + (-this.ty * this.a + this.tx * this.b) * d, c
        }, b.Matrix.prototype.translate = function (a, b) {
            return this.tx += a, this.ty += b, this
        }, b.Matrix.prototype.scale = function (a, b) {
            return this.a *= a, this.d *= b, this.c *= a, this.b *= b, this.tx *= a, this.ty *= b, this
        }, b.Matrix.prototype.rotate = function (a) {
            var b = Math.cos(a), c = Math.sin(a), d = this.a, e = this.c, f = this.tx;
            return this.a = d * b - this.b * c, this.b = d * c + this.b * b, this.c = e * b - this.d * c, this.d = e * c + this.d * b, this.tx = f * b - this.ty * c, this.ty = f * c + this.ty * b, this
        }, b.Matrix.prototype.append = function (a) {
            var b = this.a, c = this.b, d = this.c, e = this.d;
            return this.a = a.a * b + a.b * d, this.b = a.a * c + a.b * e, this.c = a.c * b + a.d * d, this.d = a.c * c + a.d * e, this.tx = a.tx * b + a.ty * d + this.tx, this.ty = a.tx * c + a.ty * e + this.ty, this
        }, b.Matrix.prototype.identity = function () {
            return this.a = 1, this.b = 0, this.c = 0, this.d = 1, this.tx = 0, this.ty = 0, this
        }, b.identityMatrix = new b.Matrix, b.DisplayObject = function () {
            this.position = new b.Point, this.scale = new b.Point(1, 1), this.pivot = new b.Point(0, 0), this.rotation = 0, this.alpha = 1, this.visible = !0, this.hitArea = null, this.buttonMode = !1, this.renderable = !1, this.parent = null, this.stage = null, this.worldAlpha = 1, this._interactive = !1, this.defaultCursor = "pointer", this.worldTransform = new b.Matrix, this._sr = 0, this._cr = 1, this.filterArea = null, this._bounds = new b.Rectangle(0, 0, 1, 1), this._currentBounds = null, this._mask = null, this._cacheAsBitmap = !1, this._cacheIsDirty = !1
        }, b.DisplayObject.prototype.constructor = b.DisplayObject, Object.defineProperty(b.DisplayObject.prototype, "interactive", {
            get: function () {
                return this._interactive
            }, set: function (a) {
                this._interactive = a, this.stage && (this.stage.dirty = !0)
            }
        }), Object.defineProperty(b.DisplayObject.prototype, "worldVisible", {
            get: function () {
                var a = this;
                do {
                    if (!a.visible) return !1;
                    a = a.parent
                } while (a);
                return !0
            }
        }), Object.defineProperty(b.DisplayObject.prototype, "mask", {
            get: function () {
                return this._mask
            }, set: function (a) {
                this._mask && (this._mask.isMask = !1), this._mask = a, this._mask && (this._mask.isMask = !0)
            }
        }), Object.defineProperty(b.DisplayObject.prototype, "filters", {
            get: function () {
                return this._filters
            }, set: function (a) {
                if (a) {
                    for (var b = [], c = 0; c < a.length; c++) for (var d = a[c].passes, e = 0; e < d.length; e++) b.push(d[e]);
                    this._filterBlock = {target: this, filterPasses: b}
                }
                this._filters = a
            }
        }), Object.defineProperty(b.DisplayObject.prototype, "cacheAsBitmap", {
            get: function () {
                return this._cacheAsBitmap
            }, set: function (a) {
                this._cacheAsBitmap !== a && (a ? this._generateCachedSprite() : this._destroyCachedSprite(), this._cacheAsBitmap = a)
            }
        }), b.DisplayObject.prototype.updateTransform = function () {
            var a, c, d, e, f, g, h = this.parent.worldTransform, i = this.worldTransform;
            this.rotation % b.PI_2 ? (this.rotation !== this.rotationCache && (this.rotationCache = this.rotation, this._sr = Math.sin(this.rotation), this._cr = Math.cos(this.rotation)), a = this._cr * this.scale.x, c = this._sr * this.scale.x, d = -this._sr * this.scale.y, e = this._cr * this.scale.y, f = this.position.x, g = this.position.y, (this.pivot.x || this.pivot.y) && (f -= this.pivot.x * a + this.pivot.y * d, g -= this.pivot.x * c + this.pivot.y * e), i.a = a * h.a + c * h.c, i.b = a * h.b + c * h.d, i.c = d * h.a + e * h.c, i.d = d * h.b + e * h.d, i.tx = f * h.a + g * h.c + h.tx, i.ty = f * h.b + g * h.d + h.ty) : (a = this.scale.x, e = this.scale.y, f = this.position.x - this.pivot.x * a, g = this.position.y - this.pivot.y * e, i.a = a * h.a, i.b = a * h.b, i.c = e * h.c, i.d = e * h.d, i.tx = f * h.a + g * h.c + h.tx, i.ty = f * h.b + g * h.d + h.ty), this.worldAlpha = this.alpha * this.parent.worldAlpha
        }, b.DisplayObject.prototype.displayObjectUpdateTransform = b.DisplayObject.prototype.updateTransform, b.DisplayObject.prototype.getBounds = function (a) {
            return a = a, b.EmptyRectangle
        }, b.DisplayObject.prototype.getLocalBounds = function () {
            return this.getBounds(b.identityMatrix)
        }, b.DisplayObject.prototype.setStageReference = function (a) {
            this.stage = a, this._interactive && (this.stage.dirty = !0)
        }, b.DisplayObject.prototype.generateTexture = function (a, c, d) {
            var e = this.getLocalBounds(), f = new b.RenderTexture(0 | e.width, 0 | e.height, d, c, a);
            return b.DisplayObject._tempMatrix.tx = -e.x, b.DisplayObject._tempMatrix.ty = -e.y, f.render(this, b.DisplayObject._tempMatrix), f
        }, b.DisplayObject.prototype.updateCache = function () {
            this._generateCachedSprite()
        }, b.DisplayObject.prototype.toGlobal = function (a) {
            return this.displayObjectUpdateTransform(), this.worldTransform.apply(a)
        }, b.DisplayObject.prototype.toLocal = function (a, b) {
            return b && (a = b.toGlobal(a)), this.displayObjectUpdateTransform(), this.worldTransform.applyInverse(a)
        }, b.DisplayObject.prototype._renderCachedSprite = function (a) {
            this._cachedSprite.worldAlpha = this.worldAlpha, a.gl ? b.Sprite.prototype._renderWebGL.call(this._cachedSprite, a) : b.Sprite.prototype._renderCanvas.call(this._cachedSprite, a)
        }, b.DisplayObject.prototype._generateCachedSprite = function () {
            this._cacheAsBitmap = !1;
            var a = this.getLocalBounds();
            if (this._cachedSprite) this._cachedSprite.texture.resize(0 | a.width, 0 | a.height); else {
                var c = new b.RenderTexture(0 | a.width, 0 | a.height);
                this._cachedSprite = new b.Sprite(c), this._cachedSprite.worldTransform = this.worldTransform
            }
            var d = this._filters;
            this._filters = null, this._cachedSprite.filters = d, b.DisplayObject._tempMatrix.tx = -a.x, b.DisplayObject._tempMatrix.ty = -a.y, this._cachedSprite.texture.render(this, b.DisplayObject._tempMatrix, !0), this._cachedSprite.anchor.x = -(a.x / a.width), this._cachedSprite.anchor.y = -(a.y / a.height), this._filters = d, this._cacheAsBitmap = !0
        }, b.DisplayObject.prototype._destroyCachedSprite = function () {
            this._cachedSprite && (this._cachedSprite.texture.destroy(!0), this._cachedSprite = null)
        }, b.DisplayObject.prototype._renderWebGL = function (a) {
            a = a
        }, b.DisplayObject.prototype._renderCanvas = function (a) {
            a = a
        }, b.DisplayObject._tempMatrix = new b.Matrix, Object.defineProperty(b.DisplayObject.prototype, "x", {
            get: function () {
                return this.position.x
            }, set: function (a) {
                this.position.x = a
            }
        }), Object.defineProperty(b.DisplayObject.prototype, "y", {
            get: function () {
                return this.position.y
            }, set: function (a) {
                this.position.y = a
            }
        }), b.DisplayObjectContainer = function () {
            b.DisplayObject.call(this), this.children = []
        }, b.DisplayObjectContainer.prototype = Object.create(b.DisplayObject.prototype), b.DisplayObjectContainer.prototype.constructor = b.DisplayObjectContainer, Object.defineProperty(b.DisplayObjectContainer.prototype, "width", {
            get: function () {
                return this.scale.x * this.getLocalBounds().width
            }, set: function (a) {
                var b = this.getLocalBounds().width;
                this.scale.x = 0 !== b ? a / b : 1, this._width = a
            }
        }), Object.defineProperty(b.DisplayObjectContainer.prototype, "height", {
            get: function () {
                return this.scale.y * this.getLocalBounds().height
            }, set: function (a) {
                var b = this.getLocalBounds().height;
                this.scale.y = 0 !== b ? a / b : 1, this._height = a
            }
        }), b.DisplayObjectContainer.prototype.addChild = function (a) {
            return this.addChildAt(a, this.children.length)
        }, b.DisplayObjectContainer.prototype.addChildAt = function (a, b) {
            if (b >= 0 && b <= this.children.length) return a.parent && a.parent.removeChild(a), a.parent = this, this.children.splice(b, 0, a), this.stage && a.setStageReference(this.stage), a;
            throw new Error(a + "addChildAt: The index " + b + " supplied is out of bounds " + this.children.length)
        }, b.DisplayObjectContainer.prototype.swapChildren = function (a, b) {
            if (a !== b) {
                var c = this.getChildIndex(a), d = this.getChildIndex(b);
                if (0 > c || 0 > d) throw new Error("swapChildren: Both the supplied DisplayObjects must be a child of the caller.");
                this.children[c] = b, this.children[d] = a
            }
        }, b.DisplayObjectContainer.prototype.getChildIndex = function (a) {
            var b = this.children.indexOf(a);
            if (-1 === b) throw new Error("The supplied DisplayObject must be a child of the caller");
            return b
        }, b.DisplayObjectContainer.prototype.setChildIndex = function (a, b) {
            if (0 > b || b >= this.children.length) throw new Error("The supplied index is out of bounds");
            var c = this.getChildIndex(a);
            this.children.splice(c, 1), this.children.splice(b, 0, a)
        }, b.DisplayObjectContainer.prototype.getChildAt = function (a) {
            if (0 > a || a >= this.children.length) throw new Error("getChildAt: Supplied index " + a + " does not exist in the child list, or the supplied DisplayObject must be a child of the caller");
            return this.children[a]
        }, b.DisplayObjectContainer.prototype.removeChild = function (a) {
            var b = this.children.indexOf(a);
            if (-1 !== b) return this.removeChildAt(b)
        }, b.DisplayObjectContainer.prototype.removeChildAt = function (a) {
            var b = this.getChildAt(a);
            return this.stage && b.removeStageReference(), b.parent = void 0, this.children.splice(a, 1), b
        }, b.DisplayObjectContainer.prototype.removeChildren = function (a, b) {
            var c = a || 0, d = "number" == typeof b ? b : this.children.length, e = d - c;
            if (e > 0 && d >= e) {
                for (var f = this.children.splice(c, e), g = 0; g < f.length; g++) {
                    var h = f[g];
                    this.stage && h.removeStageReference(), h.parent = void 0
                }
                return f
            }
            if (0 === e && 0 === this.children.length) return [];
            throw new Error("removeChildren: Range Error, numeric values are outside the acceptable range")
        }, b.DisplayObjectContainer.prototype.updateTransform = function () {
            if (this.visible && (this.displayObjectUpdateTransform(), !this._cacheAsBitmap)) for (var a = 0, b = this.children.length; b > a; a++) this.children[a].updateTransform()
        }, b.DisplayObjectContainer.prototype.displayObjectContainerUpdateTransform = b.DisplayObjectContainer.prototype.updateTransform, b.DisplayObjectContainer.prototype.getBounds = function () {
            if (0 === this.children.length) return b.EmptyRectangle;
            for (var a, c, d, e = 1 / 0, f = 1 / 0, g = -1 / 0, h = -1 / 0, i = !1, j = 0, k = this.children.length; k > j; j++) {
                var l = this.children[j];
                l.visible && (i = !0, a = this.children[j].getBounds(), e = e < a.x ? e : a.x, f = f < a.y ? f : a.y, c = a.width + a.x, d = a.height + a.y, g = g > c ? g : c, h = h > d ? h : d)
            }
            if (!i) return b.EmptyRectangle;
            var m = this._bounds;
            return m.x = e, m.y = f, m.width = g - e, m.height = h - f, m
        }, b.DisplayObjectContainer.prototype.getLocalBounds = function () {
            var a = this.worldTransform;
            this.worldTransform = b.identityMatrix;
            for (var c = 0, d = this.children.length; d > c; c++) this.children[c].updateTransform();
            var e = this.getBounds();
            return this.worldTransform = a, e
        }, b.DisplayObjectContainer.prototype.setStageReference = function (a) {
            this.stage = a, this._interactive && (this.stage.dirty = !0);
            for (var b = 0, c = this.children.length; c > b; b++) {
                var d = this.children[b];
                d.setStageReference(a)
            }
        }, b.DisplayObjectContainer.prototype.removeStageReference = function () {
            for (var a = 0, b = this.children.length; b > a; a++) {
                var c = this.children[a];
                c.removeStageReference()
            }
            this._interactive && (this.stage.dirty = !0), this.stage = null
        }, b.DisplayObjectContainer.prototype._renderWebGL = function (a) {
            if (this.visible && !(this.alpha <= 0)) {
                if (this._cacheAsBitmap) return void this._renderCachedSprite(a);
                var b, c;
                if (this._mask || this._filters) {
                    for (this._filters && (a.spriteBatch.flush(), a.filterManager.pushFilter(this._filterBlock)), this._mask && (a.spriteBatch.stop(), a.maskManager.pushMask(this.mask, a), a.spriteBatch.start()), b = 0, c = this.children.length; c > b; b++) this.children[b]._renderWebGL(a);
                    a.spriteBatch.stop(), this._mask && a.maskManager.popMask(this._mask, a), this._filters && a.filterManager.popFilter(), a.spriteBatch.start()
                } else for (b = 0, c = this.children.length; c > b; b++) this.children[b]._renderWebGL(a)
            }
        }, b.DisplayObjectContainer.prototype._renderCanvas = function (a) {
            if (this.visible !== !1 && 0 !== this.alpha) {
                if (this._cacheAsBitmap) return void this._renderCachedSprite(a);
                this._mask && a.maskManager.pushMask(this._mask, a);
                for (var b = 0, c = this.children.length; c > b; b++) {
                    var d = this.children[b];
                    d._renderCanvas(a)
                }
                this._mask && a.maskManager.popMask(a)
            }
        }, b.Sprite = function (a) {
            b.DisplayObjectContainer.call(this), this.anchor = new b.Point, this.texture = a || b.Texture.emptyTexture, this._width = 0, this._height = 0, this.tint = 16777215, this.blendMode = b.blendModes.NORMAL, this.shader = null, this.texture.baseTexture.hasLoaded ? this.onTextureUpdate() : this.texture.on("update", this.onTextureUpdate.bind(this)), this.renderable = !0
        },b.Sprite.prototype = Object.create(b.DisplayObjectContainer.prototype),b.Sprite.prototype.constructor = b.Sprite,Object.defineProperty(b.Sprite.prototype, "width", {
            get: function () {
                return this.scale.x * this.texture.frame.width
            }, set: function (a) {
                this.scale.x = a / this.texture.frame.width, this._width = a
            }
        }),Object.defineProperty(b.Sprite.prototype, "height", {
            get: function () {
                return this.scale.y * this.texture.frame.height
            }, set: function (a) {
                this.scale.y = a / this.texture.frame.height, this._height = a
            }
        }),b.Sprite.prototype.setTexture = function (a) {
            this.texture = a, this.cachedTint = 16777215
        },b.Sprite.prototype.onTextureUpdate = function () {
            this._width && (this.scale.x = this._width / this.texture.frame.width), this._height && (this.scale.y = this._height / this.texture.frame.height)
        },b.Sprite.prototype.getBounds = function (a) {
            var b = this.texture.frame.width, c = this.texture.frame.height, d = b * (1 - this.anchor.x),
                    e = b * -this.anchor.x, f = c * (1 - this.anchor.y), g = c * -this.anchor.y,
                    h = a || this.worldTransform, i = h.a, j = h.b, k = h.c, l = h.d, m = h.tx, n = h.ty, o = -1 / 0,
                    p = -1 / 0, q = 1 / 0, r = 1 / 0;
            if (0 === j && 0 === k) 0 > i && (i *= -1), 0 > l && (l *= -1), q = i * e + m, o = i * d + m, r = l * g + n, p = l * f + n; else {
                var s = i * e + k * g + m, t = l * g + j * e + n, u = i * d + k * g + m, v = l * g + j * d + n,
                        w = i * d + k * f + m, x = l * f + j * d + n, y = i * e + k * f + m, z = l * f + j * e + n;
                q = q > s ? s : q, q = q > u ? u : q, q = q > w ? w : q, q = q > y ? y : q, r = r > t ? t : r, r = r > v ? v : r, r = r > x ? x : r, r = r > z ? z : r, o = s > o ? s : o, o = u > o ? u : o, o = w > o ? w : o, o = y > o ? y : o, p = t > p ? t : p, p = v > p ? v : p, p = x > p ? x : p, p = z > p ? z : p
            }
            var A = this._bounds;
            return A.x = q, A.width = o - q, A.y = r, A.height = p - r, this._currentBounds = A, A
        },b.Sprite.prototype._renderWebGL = function (a) {
            if (this.visible && !(this.alpha <= 0)) {
                var b, c;
                if (this._mask || this._filters) {
                    var d = a.spriteBatch;
                    for (this._filters && (d.flush(), a.filterManager.pushFilter(this._filterBlock)), this._mask && (d.stop(), a.maskManager.pushMask(this.mask, a), d.start()), d.render(this), b = 0, c = this.children.length; c > b; b++) this.children[b]._renderWebGL(a);
                    d.stop(), this._mask && a.maskManager.popMask(this._mask, a), this._filters && a.filterManager.popFilter(), d.start()
                } else for (a.spriteBatch.render(this), b = 0, c = this.children.length; c > b; b++) this.children[b]._renderWebGL(a)
            }
        },b.Sprite.prototype._renderCanvas = function (a) {
            if (!(this.visible === !1 || 0 === this.alpha || this.texture.crop.width <= 0 || this.texture.crop.height <= 0)) {
                if (this.blendMode !== a.currentBlendMode && (a.currentBlendMode = this.blendMode, a.context.globalCompositeOperation = b.blendModesCanvas[a.currentBlendMode]), this._mask && a.maskManager.pushMask(this._mask, a), this.texture.valid) {
                    var c = this.texture.baseTexture.resolution / a.resolution;
                    a.context.globalAlpha = this.worldAlpha, a.smoothProperty && a.scaleMode !== this.texture.baseTexture.scaleMode && (a.scaleMode = this.texture.baseTexture.scaleMode, a.context[a.smoothProperty] = a.scaleMode === b.scaleModes.LINEAR);
                    var d = this.texture.trim ? this.texture.trim.x - this.anchor.x * this.texture.trim.width : this.anchor.x * -this.texture.frame.width,
                            e = this.texture.trim ? this.texture.trim.y - this.anchor.y * this.texture.trim.height : this.anchor.y * -this.texture.frame.height;
                    a.roundPixels ? (a.context.setTransform(this.worldTransform.a, this.worldTransform.b, this.worldTransform.c, this.worldTransform.d, this.worldTransform.tx * a.resolution | 0, this.worldTransform.ty * a.resolution | 0), d = 0 | d, e = 0 | e) : a.context.setTransform(this.worldTransform.a, this.worldTransform.b, this.worldTransform.c, this.worldTransform.d, this.worldTransform.tx * a.resolution, this.worldTransform.ty * a.resolution), 16777215 !== this.tint ? (this.cachedTint !== this.tint && (this.cachedTint = this.tint, this.tintedTexture = b.CanvasTinter.getTintedTexture(this, this.tint)), a.context.drawImage(this.tintedTexture, 0, 0, this.texture.crop.width, this.texture.crop.height, d / c, e / c, this.texture.crop.width / c, this.texture.crop.height / c)) : a.context.drawImage(this.texture.baseTexture.source, this.texture.crop.x, this.texture.crop.y, this.texture.crop.width, this.texture.crop.height, d / c, e / c, this.texture.crop.width / c, this.texture.crop.height / c)
                }
                for (var f = 0, g = this.children.length; g > f; f++) this.children[f]._renderCanvas(a);
                this._mask && a.maskManager.popMask(a)
            }
        },b.Sprite.fromFrame = function (a) {
            var c = b.TextureCache[a];
            if (!c) throw new Error('The frameId "' + a + '" does not exist in the texture cache' + this);
            return new b.Sprite(c)
        },b.Sprite.fromImage = function (a, c, d) {
            var e = b.Texture.fromImage(a, c, d);
            return new b.Sprite(e)
        },b.SpriteBatch = function (a) {
            b.DisplayObjectContainer.call(this), this.textureThing = a, this.ready = !1
        },b.SpriteBatch.prototype = Object.create(b.DisplayObjectContainer.prototype),b.SpriteBatch.prototype.constructor = b.SpriteBatch,b.SpriteBatch.prototype.initWebGL = function (a) {
            this.fastSpriteBatch = new b.WebGLFastSpriteBatch(a), this.ready = !0
        },b.SpriteBatch.prototype.updateTransform = function () {
            this.displayObjectUpdateTransform()
        },b.SpriteBatch.prototype._renderWebGL = function (a) {
            !this.visible || this.alpha <= 0 || !this.children.length || (this.ready || this.initWebGL(a.gl), a.spriteBatch.stop(), a.shaderManager.setShader(a.shaderManager.fastShader), this.fastSpriteBatch.begin(this, a), this.fastSpriteBatch.render(this), a.spriteBatch.start())
        },b.SpriteBatch.prototype._renderCanvas = function (a) {
            if (this.visible && !(this.alpha <= 0) && this.children.length) {
                var b = a.context;
                b.globalAlpha = this.worldAlpha, this.displayObjectUpdateTransform();
                for (var c = this.worldTransform, d = !0, e = 0; e < this.children.length; e++) {
                    var f = this.children[e];
                    if (f.visible) {
                        var g = f.texture, h = g.frame;
                        if (b.globalAlpha = this.worldAlpha * f.alpha, f.rotation % (2 * Math.PI) === 0) d && (b.setTransform(c.a, c.b, c.c, c.d, c.tx, c.ty), d = !1), b.drawImage(g.baseTexture.source, h.x, h.y, h.width, h.height, f.anchor.x * -h.width * f.scale.x + f.position.x + .5 | 0, f.anchor.y * -h.height * f.scale.y + f.position.y + .5 | 0, h.width * f.scale.x, h.height * f.scale.y); else {
                            d || (d = !0), f.displayObjectUpdateTransform();
                            var i = f.worldTransform;
                            a.roundPixels ? b.setTransform(i.a, i.b, i.c, i.d, 0 | i.tx, 0 | i.ty) : b.setTransform(i.a, i.b, i.c, i.d, i.tx, i.ty), b.drawImage(g.baseTexture.source, h.x, h.y, h.width, h.height, f.anchor.x * -h.width + .5 | 0, f.anchor.y * -h.height + .5 | 0, h.width, h.height)
                        }
                    }
                }
            }
        },b.MovieClip = function (a) {
            b.Sprite.call(this, a[0]), this.textures = a, this.animationSpeed = 1, this.loop = !0, this.onComplete = null, this.currentFrame = 0, this.playing = !1
        },b.MovieClip.prototype = Object.create(b.Sprite.prototype),b.MovieClip.prototype.constructor = b.MovieClip,Object.defineProperty(b.MovieClip.prototype, "totalFrames", {
            get: function () {
                return this.textures.length
            }
        }),b.MovieClip.prototype.stop = function () {
            this.playing = !1
        },b.MovieClip.prototype.play = function () {
            this.playing = !0
        },b.MovieClip.prototype.gotoAndStop = function (a) {
            this.playing = !1, this.currentFrame = a;
            var b = this.currentFrame + .5 | 0;
            this.setTexture(this.textures[b % this.textures.length])
        },b.MovieClip.prototype.gotoAndPlay = function (a) {
            this.currentFrame = a, this.playing = !0
        },b.MovieClip.prototype.updateTransform = function () {
            if (this.displayObjectContainerUpdateTransform(), this.playing) {
                this.currentFrame += this.animationSpeed;
                var a = this.currentFrame + .5 | 0;
                this.currentFrame = this.currentFrame % this.textures.length, this.loop || a < this.textures.length ? this.setTexture(this.textures[a % this.textures.length]) : a >= this.textures.length && (this.gotoAndStop(this.textures.length - 1), this.onComplete && this.onComplete())
            }
        },b.MovieClip.fromFrames = function (a) {
            for (var c = [], d = 0; d < a.length; d++) c.push(new b.Texture.fromFrame(a[d]));
            return new b.MovieClip(c)
        },b.MovieClip.fromImages = function (a) {
            for (var c = [], d = 0; d < a.length; d++) c.push(new b.Texture.fromImage(a[d]));
            return new b.MovieClip(c)
        },b.FilterBlock = function () {
            this.visible = !0, this.renderable = !0
        },b.FilterBlock.prototype.constructor = b.FilterBlock,b.Text = function (a, c) {
            this.canvas = document.createElement("canvas"), this.context = this.canvas.getContext("2d"), this.resolution = 1, b.Sprite.call(this, b.Texture.fromCanvas(this.canvas)), this.setText(a), this.setStyle(c)
        },b.Text.prototype = Object.create(b.Sprite.prototype),b.Text.prototype.constructor = b.Text,Object.defineProperty(b.Text.prototype, "width", {
            get: function () {
                return this.dirty && (this.updateText(), this.dirty = !1), this.scale.x * this.texture.frame.width
            }, set: function (a) {
                this.scale.x = a / this.texture.frame.width, this._width = a
            }
        }),Object.defineProperty(b.Text.prototype, "height", {
            get: function () {
                return this.dirty && (this.updateText(), this.dirty = !1), this.scale.y * this.texture.frame.height
            }, set: function (a) {
                this.scale.y = a / this.texture.frame.height, this._height = a
            }
        }),b.Text.prototype.setStyle = function (a) {
            a = a || {}, a.font = a.font || "bold 20pt Arial", a.fill = a.fill || "black", a.align = a.align || "left", a.stroke = a.stroke || "black", a.strokeThickness = a.strokeThickness || 0, a.wordWrap = a.wordWrap || !1, a.wordWrapWidth = a.wordWrapWidth || 100, a.dropShadow = a.dropShadow || !1, a.dropShadowAngle = a.dropShadowAngle || Math.PI / 6, a.dropShadowDistance = a.dropShadowDistance || 4, a.dropShadowColor = a.dropShadowColor || "black", this.style = a, this.dirty = !0
        },b.Text.prototype.setText = function (a) {
            this.text = a.toString() || " ", this.dirty = !0
        },b.Text.prototype.updateText = function () {
            this.texture.baseTexture.resolution = this.resolution, this.context.font = this.style.font;
            var a = this.text;
            this.style.wordWrap && (a = this.wordWrap(this.text));
            for (var b = a.split(/(?:\r\n|\r|\n)/), c = [], d = 0, e = this.determineFontProperties(this.style.font), f = 0; f < b.length; f++) {
                var g = this.context.measureText(b[f]).width;
                c[f] = g, d = Math.max(d, g)
            }
            var h = d + this.style.strokeThickness;
            this.style.dropShadow && (h += this.style.dropShadowDistance), this.canvas.width = (h + this.context.lineWidth) * this.resolution;
            var i = e.fontSize + this.style.strokeThickness, j = i * b.length;
            this.style.dropShadow && (j += this.style.dropShadowDistance), this.canvas.height = j * this.resolution, this.context.scale(this.resolution, this.resolution), navigator.isCocoonJS && this.context.clearRect(0, 0, this.canvas.width, this.canvas.height), this.context.font = this.style.font, this.context.strokeStyle = this.style.stroke, this.context.lineWidth = this.style.strokeThickness, this.context.textBaseline = "alphabetic";
            var k, l;
            if (this.style.dropShadow) {
                this.context.fillStyle = this.style.dropShadowColor;
                var m = Math.sin(this.style.dropShadowAngle) * this.style.dropShadowDistance,
                        n = Math.cos(this.style.dropShadowAngle) * this.style.dropShadowDistance;
                for (f = 0; f < b.length; f++) k = this.style.strokeThickness / 2, l = this.style.strokeThickness / 2 + f * i + e.ascent, "right" === this.style.align ? k += d - c[f] : "center" === this.style.align && (k += (d - c[f]) / 2), this.style.fill && this.context.fillText(b[f], k + m, l + n)
            }
            for (this.context.fillStyle = this.style.fill, f = 0; f < b.length; f++) k = this.style.strokeThickness / 2, l = this.style.strokeThickness / 2 + f * i + e.ascent, "right" === this.style.align ? k += d - c[f] : "center" === this.style.align && (k += (d - c[f]) / 2), this.style.stroke && this.style.strokeThickness && this.context.strokeText(b[f], k, l), this.style.fill && this.context.fillText(b[f], k, l);
            this.updateTexture()
        },b.Text.prototype.updateTexture = function () {
            this.texture.baseTexture.width = this.canvas.width, this.texture.baseTexture.height = this.canvas.height, this.texture.crop.width = this.texture.frame.width = this.canvas.width, this.texture.crop.height = this.texture.frame.height = this.canvas.height, this._width = this.canvas.width, this._height = this.canvas.height, this.texture.baseTexture.dirty()
        },b.Text.prototype._renderWebGL = function (a) {
            this.dirty && (this.resolution = a.resolution, this.updateText(), this.dirty = !1), b.Sprite.prototype._renderWebGL.call(this, a)
        },b.Text.prototype._renderCanvas = function (a) {
            this.dirty && (this.resolution = a.resolution, this.updateText(), this.dirty = !1), b.Sprite.prototype._renderCanvas.call(this, a)
        },b.Text.prototype.determineFontProperties = function (a) {
            var c = b.Text.fontPropertiesCache[a];
            if (!c) {
                c = {};
                var d = b.Text.fontPropertiesCanvas, e = b.Text.fontPropertiesContext;
                e.font = a;
                var f = Math.ceil(e.measureText("|Mq").width), g = Math.ceil(e.measureText("M").width), h = 2 * g;
                g = 1.4 * g | 0, d.width = f, d.height = h, e.fillStyle = "#f00", e.fillRect(0, 0, f, h), e.font = a, e.textBaseline = "alphabetic", e.fillStyle = "#000", e.fillText("|MÉq", 0, g);
                var i, j, k = e.getImageData(0, 0, f, h).data, l = k.length, m = 4 * f, n = 0, o = !1;
                for (i = 0; g > i; i++) {
                    for (j = 0; m > j; j += 4) if (255 !== k[n + j]) {
                        o = !0;
                        break
                    }
                    if (o) break;
                    n += m
                }
                for (c.ascent = g - i, n = l - m, o = !1, i = h; i > g; i--) {
                    for (j = 0; m > j; j += 4) if (255 !== k[n + j]) {
                        o = !0;
                        break
                    }
                    if (o) break;
                    n -= m
                }
                c.descent = i - g, c.descent += 6, c.fontSize = c.ascent + c.descent, b.Text.fontPropertiesCache[a] = c
            }
            return c
        },b.Text.prototype.wordWrap = function (a) {
            for (var b = "", c = a.split("\n"), d = 0; d < c.length; d++) {
                for (var e = this.style.wordWrapWidth, f = c[d].split(" "), g = 0; g < f.length; g++) {
                    var h = this.context.measureText(f[g]).width, i = h + this.context.measureText(" ").width;
                    0 === g || i > e ? (g > 0 && (b += "\n"), b += f[g], e = this.style.wordWrapWidth - h) : (e -= i, b += " " + f[g])
                }
                d < c.length - 1 && (b += "\n")
            }
            return b
        },b.Text.prototype.getBounds = function (a) {
            return this.dirty && (this.updateText(), this.dirty = !1), b.Sprite.prototype.getBounds.call(this, a)
        },b.Text.prototype.destroy = function (a) {
            this.context = null, this.canvas = null, this.texture.destroy(void 0 === a ? !0 : a)
        },b.Text.fontPropertiesCache = {},b.Text.fontPropertiesCanvas = document.createElement("canvas"),b.Text.fontPropertiesContext = b.Text.fontPropertiesCanvas.getContext("2d"),b.BitmapText = function (a, c) {
            b.DisplayObjectContainer.call(this), this.textWidth = 0, this.textHeight = 0, this._pool = [], this.setText(a), this.setStyle(c), this.updateText(), this.dirty = !1
        },b.BitmapText.prototype = Object.create(b.DisplayObjectContainer.prototype),b.BitmapText.prototype.constructor = b.BitmapText,b.BitmapText.prototype.setText = function (a) {
            this.text = a || " ", this.dirty = !0
        },b.BitmapText.prototype.setStyle = function (a) {
            a = a || {}, a.align = a.align || "left", this.style = a;
            var c = a.font.split(" ");
            this.fontName = c[c.length - 1], this.fontSize = c.length >= 2 ? parseInt(c[c.length - 2], 10) : b.BitmapText.fonts[this.fontName].size, this.dirty = !0, this.tint = a.tint
        },b.BitmapText.prototype.updateText = function () {
            for (var a = b.BitmapText.fonts[this.fontName], c = new b.Point, d = null, e = [], f = 0, g = [], h = 0, i = this.fontSize / a.size, j = 0; j < this.text.length; j++) {
                var k = this.text.charCodeAt(j);
                if (/(?:\r\n|\r|\n)/.test(this.text.charAt(j))) g.push(c.x), f = Math.max(f, c.x), h++, c.x = 0, c.y += a.lineHeight, d = null; else {
                    var l = a.chars[k];
                    l && (d && l.kerning[d] && (c.x += l.kerning[d]), e.push({
                        texture: l.texture,
                        line: h,
                        charCode: k,
                        position: new b.Point(c.x + l.xOffset, c.y + l.yOffset)
                    }), c.x += l.xAdvance, d = k)
                }
            }
            g.push(c.x), f = Math.max(f, c.x);
            var m = [];
            for (j = 0; h >= j; j++) {
                var n = 0;
                "right" === this.style.align ? n = f - g[j] : "center" === this.style.align && (n = (f - g[j]) / 2), m.push(n)
            }
            var o = this.children.length, p = e.length, q = this.tint || 16777215;
            for (j = 0; p > j; j++) {
                var r = o > j ? this.children[j] : this._pool.pop();
                r ? r.setTexture(e[j].texture) : r = new b.Sprite(e[j].texture), r.position.x = (e[j].position.x + m[e[j].line]) * i, r.position.y = e[j].position.y * i, r.scale.x = r.scale.y = i, r.tint = q, r.parent || this.addChild(r)
            }
            for (; this.children.length > p;) {
                var s = this.getChildAt(this.children.length - 1);
                this._pool.push(s), this.removeChild(s)
            }
            this.textWidth = f * i, this.textHeight = (c.y + a.lineHeight) * i
        },b.BitmapText.prototype.updateTransform = function () {
            this.dirty && (this.updateText(), this.dirty = !1), b.DisplayObjectContainer.prototype.updateTransform.call(this)
        },b.BitmapText.fonts = {},b.InteractionData = function () {
            this.global = new b.Point, this.target = null, this.originalEvent = null
        },b.InteractionData.prototype.getLocalPosition = function (a, c) {
            var d = a.worldTransform, e = this.global, f = d.a, g = d.c, h = d.tx, i = d.b, j = d.d, k = d.ty,
                    l = 1 / (f * j + g * -i);
            return c = c || new b.Point, c.x = j * l * e.x + -g * l * e.y + (k * g - h * j) * l, c.y = f * l * e.y + -i * l * e.x + (-k * f + h * i) * l, c
        },b.InteractionData.prototype.constructor = b.InteractionData,b.InteractionManager = function (a) {
            this.stage = a, this.mouse = new b.InteractionData, this.touches = {}, this.tempPoint = new b.Point, this.mouseoverEnabled = !0, this.pool = [], this.interactiveItems = [], this.interactionDOMElement = null, this.onMouseMove = this.onMouseMove.bind(this), this.onMouseDown = this.onMouseDown.bind(this), this.onMouseOut = this.onMouseOut.bind(this), this.onMouseUp = this.onMouseUp.bind(this), this.onTouchStart = this.onTouchStart.bind(this), this.onTouchEnd = this.onTouchEnd.bind(this), this.onTouchMove = this.onTouchMove.bind(this), this.last = 0, this.currentCursorStyle = "inherit", this.mouseOut = !1, this.resolution = 1, this._tempPoint = new b.Point
        },b.InteractionManager.prototype.constructor = b.InteractionManager,b.InteractionManager.prototype.collectInteractiveSprite = function (a, b) {
            for (var c = a.children, d = c.length, e = d - 1; e >= 0; e--) {
                var f = c[e];
                f._interactive ? (b.interactiveChildren = !0, this.interactiveItems.push(f), f.children.length > 0 && this.collectInteractiveSprite(f, f)) : (f.__iParent = null, f.children.length > 0 && this.collectInteractiveSprite(f, b))
            }
        },b.InteractionManager.prototype.setTarget = function (a) {
            this.target = a, this.resolution = a.resolution, null === this.interactionDOMElement && this.setTargetDomElement(a.view)
        },b.InteractionManager.prototype.setTargetDomElement = function (a) {
            this.removeEvents(), window.navigator.msPointerEnabled && (a.style["-ms-content-zooming"] = "none", a.style["-ms-touch-action"] = "none"), this.interactionDOMElement = a, a.addEventListener("mousemove", this.onMouseMove, !0), a.addEventListener("mousedown", this.onMouseDown, !0), a.addEventListener("mouseout", this.onMouseOut, !0), a.addEventListener("touchstart", this.onTouchStart, !0), a.addEventListener("touchend", this.onTouchEnd, !0), a.addEventListener("touchmove", this.onTouchMove, !0), window.addEventListener("mouseup", this.onMouseUp, !0)
        },b.InteractionManager.prototype.removeEvents = function () {
            this.interactionDOMElement && (this.interactionDOMElement.style["-ms-content-zooming"] = "", this.interactionDOMElement.style["-ms-touch-action"] = "", this.interactionDOMElement.removeEventListener("mousemove", this.onMouseMove, !0), this.interactionDOMElement.removeEventListener("mousedown", this.onMouseDown, !0), this.interactionDOMElement.removeEventListener("mouseout", this.onMouseOut, !0), this.interactionDOMElement.removeEventListener("touchstart", this.onTouchStart, !0), this.interactionDOMElement.removeEventListener("touchend", this.onTouchEnd, !0), this.interactionDOMElement.removeEventListener("touchmove", this.onTouchMove, !0), this.interactionDOMElement = null, window.removeEventListener("mouseup", this.onMouseUp, !0))
        },b.InteractionManager.prototype.update = function () {
            if (this.target) {
                var a = Date.now(), c = a - this.last;
                if (c = c * b.INTERACTION_FREQUENCY / 1e3, !(1 > c)) {
                    this.last = a;
                    var d = 0;
                    this.dirty && this.rebuildInteractiveGraph();
                    var e = this.interactiveItems.length, f = "inherit", g = !1;
                    for (d = 0; e > d; d++) {
                        var h = this.interactiveItems[d];
                        h.__hit = this.hitTest(h, this.mouse), this.mouse.target = h, h.__hit && !g ? (h.buttonMode && (f = h.defaultCursor), h.interactiveChildren || (g = !0), h.__isOver || (h.mouseover && h.mouseover(this.mouse), h.__isOver = !0)) : h.__isOver && (h.mouseout && h.mouseout(this.mouse), h.__isOver = !1)
                    }
                    this.currentCursorStyle !== f && (this.currentCursorStyle = f, this.interactionDOMElement.style.cursor = f)
                }
            }
        },b.InteractionManager.prototype.rebuildInteractiveGraph = function () {
            this.dirty = !1;
            for (var a = this.interactiveItems.length, b = 0; a > b; b++) this.interactiveItems[b].interactiveChildren = !1;
            this.interactiveItems = [], this.stage.interactive && this.interactiveItems.push(this.stage), this.collectInteractiveSprite(this.stage, this.stage)
        },b.InteractionManager.prototype.onMouseMove = function (a) {
            this.dirty && this.rebuildInteractiveGraph(), this.mouse.originalEvent = a;
            var b = this.interactionDOMElement.getBoundingClientRect();
            this.mouse.global.x = (a.clientX - b.left) * (this.target.width / b.width) / this.resolution, this.mouse.global.y = (a.clientY - b.top) * (this.target.height / b.height) / this.resolution;
            for (var c = this.interactiveItems.length, d = 0; c > d; d++) {
                var e = this.interactiveItems[d];
                e.mousemove && e.mousemove(this.mouse)
            }
        },b.InteractionManager.prototype.onMouseDown = function (a) {
            this.dirty && this.rebuildInteractiveGraph(), this.mouse.originalEvent = a, b.AUTO_PREVENT_DEFAULT && this.mouse.originalEvent.preventDefault();
            for (var c = this.interactiveItems.length, d = this.mouse.originalEvent, e = 2 === d.button || 3 === d.which, f = e ? "rightdown" : "mousedown", g = e ? "rightclick" : "click", h = e ? "__rightIsDown" : "__mouseIsDown", i = e ? "__isRightDown" : "__isDown", j = 0; c > j; j++) {
                var k = this.interactiveItems[j];
                if ((k[f] || k[g]) && (k[h] = !0, k.__hit = this.hitTest(k, this.mouse), k.__hit && (k[f] && k[f](this.mouse), k[i] = !0, !k.interactiveChildren))) break
            }
        },b.InteractionManager.prototype.onMouseOut = function (a) {
            this.dirty && this.rebuildInteractiveGraph(), this.mouse.originalEvent = a;
            var b = this.interactiveItems.length;
            this.interactionDOMElement.style.cursor = "inherit";
            for (var c = 0; b > c; c++) {
                var d = this.interactiveItems[c];
                d.__isOver && (this.mouse.target = d, d.mouseout && d.mouseout(this.mouse), d.__isOver = !1)
            }
            this.mouseOut = !0, this.mouse.global.x = -1e4, this.mouse.global.y = -1e4
        },b.InteractionManager.prototype.onMouseUp = function (a) {
            this.dirty && this.rebuildInteractiveGraph(), this.mouse.originalEvent = a;
            for (var b = this.interactiveItems.length, c = !1, d = this.mouse.originalEvent, e = 2 === d.button || 3 === d.which, f = e ? "rightup" : "mouseup", g = e ? "rightclick" : "click", h = e ? "rightupoutside" : "mouseupoutside", i = e ? "__isRightDown" : "__isDown", j = 0; b > j; j++) {
                var k = this.interactiveItems[j];
                (k[g] || k[f] || k[h]) && (k.__hit = this.hitTest(k, this.mouse), k.__hit && !c ? (k[f] && k[f](this.mouse), k[i] && k[g] && k[g](this.mouse), k.interactiveChildren || (c = !0)) : k[i] && k[h] && k[h](this.mouse), k[i] = !1)
            }
        },b.InteractionManager.prototype.hitTest = function (a, c) {
            var d = c.global;
            if (!a.worldVisible) return !1;
            a.worldTransform.applyInverse(d, this._tempPoint);
            var e, f = this._tempPoint.x, g = this._tempPoint.y;
            if (c.target = a, a.hitArea && a.hitArea.contains) return a.hitArea.contains(f, g);
            if (a instanceof b.Sprite) {
                var h, i = a.texture.frame.width, j = a.texture.frame.height, k = -i * a.anchor.x;
                if (f > k && k + i > f && (h = -j * a.anchor.y, g > h && h + j > g)) return !0
            } else if (a instanceof b.Graphics) {
                var l = a.graphicsData;
                for (e = 0; e < l.length; e++) {
                    var m = l[e];
                    if (m.fill && m.shape && m.shape.contains(f, g)) return !0
                }
            }
            var n = a.children.length;
            for (e = 0; n > e; e++) {
                var o = a.children[e], p = this.hitTest(o, c);
                if (p) return c.target = a, !0
            }
            return !1
        },b.InteractionManager.prototype.onTouchMove = function (a) {
            this.dirty && this.rebuildInteractiveGraph();
            var b, c = this.interactionDOMElement.getBoundingClientRect(), d = a.changedTouches, e = 0;
            for (e = 0; e < d.length; e++) {
                var f = d[e];
                b = this.touches[f.identifier], b.originalEvent = a, b.global.x = (f.clientX - c.left) * (this.target.width / c.width) / this.resolution, b.global.y = (f.clientY - c.top) * (this.target.height / c.height) / this.resolution, !navigator.isCocoonJS || c.left || c.top || a.target.style.width || a.target.style.height || (b.global.x = f.clientX, b.global.y = f.clientY);
                for (var g = 0; g < this.interactiveItems.length; g++) {
                    var h = this.interactiveItems[g];
                    h.touchmove && h.__touchData && h.__touchData[f.identifier] && h.touchmove(b)
                }
            }
        },b.InteractionManager.prototype.onTouchStart = function (a) {
            this.dirty && this.rebuildInteractiveGraph();
            var c = this.interactionDOMElement.getBoundingClientRect();
            b.AUTO_PREVENT_DEFAULT && a.preventDefault();
            for (var d = a.changedTouches, e = 0; e < d.length; e++) {
                var f = d[e], g = this.pool.pop();
                g || (g = new b.InteractionData), g.originalEvent = a, this.touches[f.identifier] = g, g.global.x = (f.clientX - c.left) * (this.target.width / c.width) / this.resolution, g.global.y = (f.clientY - c.top) * (this.target.height / c.height) / this.resolution, !navigator.isCocoonJS || c.left || c.top || a.target.style.width || a.target.style.height || (g.global.x = f.clientX, g.global.y = f.clientY);
                for (var h = this.interactiveItems.length, i = 0; h > i; i++) {
                    var j = this.interactiveItems[i];
                    if ((j.touchstart || j.tap) && (j.__hit = this.hitTest(j, g), j.__hit && (j.touchstart && j.touchstart(g), j.__isDown = !0, j.__touchData = j.__touchData || {}, j.__touchData[f.identifier] = g, !j.interactiveChildren))) break
                }
            }
        },b.InteractionManager.prototype.onTouchEnd = function (a) {
            this.dirty && this.rebuildInteractiveGraph();
            for (var b = this.interactionDOMElement.getBoundingClientRect(), c = a.changedTouches, d = 0; d < c.length; d++) {
                var e = c[d], f = this.touches[e.identifier], g = !1;
                f.global.x = (e.clientX - b.left) * (this.target.width / b.width) / this.resolution, f.global.y = (e.clientY - b.top) * (this.target.height / b.height) / this.resolution, !navigator.isCocoonJS || b.left || b.top || a.target.style.width || a.target.style.height || (f.global.x = e.clientX, f.global.y = e.clientY);
                for (var h = this.interactiveItems.length, i = 0; h > i; i++) {
                    var j = this.interactiveItems[i];
                    j.__touchData && j.__touchData[e.identifier] && (j.__hit = this.hitTest(j, j.__touchData[e.identifier]), f.originalEvent = a, (j.touchend || j.tap) && (j.__hit && !g ? (j.touchend && j.touchend(f), j.__isDown && j.tap && j.tap(f), j.interactiveChildren || (g = !0)) : j.__isDown && j.touchendoutside && j.touchendoutside(f), j.__isDown = !1), j.__touchData[e.identifier] = null)
                }
                this.pool.push(f), this.touches[e.identifier] = null
            }
        },b.Stage = function (a) {
            b.DisplayObjectContainer.call(this), this.worldTransform = new b.Matrix, this.interactive = !0, this.interactionManager = new b.InteractionManager(this), this.dirty = !0, this.stage = this, this.stage.hitArea = new b.Rectangle(0, 0, 1e5, 1e5), this.setBackgroundColor(a)
        },b.Stage.prototype = Object.create(b.DisplayObjectContainer.prototype),b.Stage.prototype.constructor = b.Stage,b.Stage.prototype.setInteractionDelegate = function (a) {
            this.interactionManager.setTargetDomElement(a)
        },b.Stage.prototype.updateTransform = function () {
            this.worldAlpha = 1;
            for (var a = 0, b = this.children.length; b > a; a++) this.children[a].updateTransform();
            this.dirty && (this.dirty = !1, this.interactionManager.dirty = !0), this.interactive && this.interactionManager.update()
        },b.Stage.prototype.setBackgroundColor = function (a) {
            this.backgroundColor = a || 0, this.backgroundColorSplit = b.hex2rgb(this.backgroundColor);
            var c = this.backgroundColor.toString(16);
            c = "000000".substr(0, 6 - c.length) + c, this.backgroundColorString = "#" + c
        },b.Stage.prototype.getMousePosition = function () {
            return this.interactionManager.mouse.global
        },function (a) {
            for (var b = 0, c = ["ms", "moz", "webkit", "o"], d = 0; d < c.length && !a.requestAnimationFrame; ++d) a.requestAnimationFrame = a[c[d] + "RequestAnimationFrame"], a.cancelAnimationFrame = a[c[d] + "CancelAnimationFrame"] || a[c[d] + "CancelRequestAnimationFrame"];
            a.requestAnimationFrame || (a.requestAnimationFrame = function (c) {
                var d = (new Date).getTime(), e = Math.max(0, 16 - (d - b)), f = a.setTimeout(function () {
                    c(d + e)
                }, e);
                return b = d + e, f
            }), a.cancelAnimationFrame || (a.cancelAnimationFrame = function (a) {
                clearTimeout(a)
            }), a.requestAnimFrame = a.requestAnimationFrame
        }(this),b.hex2rgb = function (a) {
            return [(a >> 16 & 255) / 255, (a >> 8 & 255) / 255, (255 & a) / 255]
        },b.rgb2hex = function (a) {
            return (255 * a[0] << 16) + (255 * a[1] << 8) + 255 * a[2]
        },"function" != typeof Function.prototype.bind && (Function.prototype.bind = function () {
            return function (a) {
                function b() {
                    for (var d = arguments.length, f = new Array(d); d--;) f[d] = arguments[d];
                    return f = e.concat(f), c.apply(this instanceof b ? this : a, f)
                }

                var c = this, d = arguments.length - 1, e = [];
                if (d > 0) for (e.length = d; d--;) e[d] = arguments[d + 1];
                if ("function" != typeof c) throw new TypeError;
                return b.prototype = function f(a) {
                    return a && (f.prototype = a), this instanceof f ? void 0 : new f
                }(c.prototype), b
            }
        }()),b.AjaxRequest = function () {
            var a = ["Msxml2.XMLHTTP.6.0", "Msxml2.XMLHTTP.3.0", "Microsoft.XMLHTTP"];
            if (!window.ActiveXObject) return window.XMLHttpRequest ? new window.XMLHttpRequest : !1;
            for (var b = 0; b < a.length; b++) try {
                return new window.ActiveXObject(a[b])
            } catch (c) {
            }
        },b.canUseNewCanvasBlendModes = function () {
            if ("undefined" == typeof document) return !1;
            var a = document.createElement("canvas");
            a.width = 1, a.height = 1;
            var b = a.getContext("2d");
            return b.fillStyle = "#000", b.fillRect(0, 0, 1, 1), b.globalCompositeOperation = "multiply", b.fillStyle = "#fff", b.fillRect(0, 0, 1, 1), 0 === b.getImageData(0, 0, 1, 1).data[0]
        },b.getNextPowerOfTwo = function (a) {
            if (a > 0 && 0 === (a & a - 1)) return a;
            for (var b = 1; a > b;) b <<= 1;
            return b
        },b.isPowerOfTwo = function (a, b) {
            return a > 0 && 0 === (a & a - 1) && b > 0 && 0 === (b & b - 1)
        },b.EventTarget = {
            call: function (a) {
                a && (a = a.prototype || a, b.EventTarget.mixin(a))
            }, mixin: function (a) {
                a.listeners = function (a) {
                    return this._listeners = this._listeners || {}, this._listeners[a] ? this._listeners[a].slice() : []
                }, a.emit = a.dispatchEvent = function (a, c) {
                    if (this._listeners = this._listeners || {}, "object" == typeof a && (c = a, a = a.type), c && c.__isEventObject === !0 || (c = new b.Event(this, a, c)), this._listeners && this._listeners[a]) {
                        var d, e = this._listeners[a].slice(0), f = e.length, g = e[0];
                        for (d = 0; f > d; g = e[++d]) if (g.call(this, c), c.stoppedImmediate) return this;
                        if (c.stopped) return this
                    }
                    return this.parent && this.parent.emit && this.parent.emit.call(this.parent, a, c), this
                }, a.on = a.addEventListener = function (a, b) {
                    return this._listeners = this._listeners || {}, (this._listeners[a] = this._listeners[a] || []).push(b), this
                }, a.once = function (a, b) {
                    function c() {
                        b.apply(d.off(a, c), arguments)
                    }

                    this._listeners = this._listeners || {};
                    var d = this;
                    return c._originalHandler = b, this.on(a, c)
                }, a.off = a.removeEventListener = function (a, b) {
                    if (this._listeners = this._listeners || {}, !this._listeners[a]) return this;
                    for (var c = this._listeners[a], d = b ? c.length : 0; d-- > 0;) (c[d] === b || c[d]._originalHandler === b) && c.splice(d, 1);
                    return 0 === c.length && delete this._listeners[a], this
                }, a.removeAllListeners = function (a) {
                    return this._listeners = this._listeners || {}, this._listeners[a] ? (delete this._listeners[a], this) : this
                }
            }
        },b.Event = function (a, b, c) {
            this.__isEventObject = !0, this.stopped = !1, this.stoppedImmediate = !1, this.target = a, this.type = b, this.data = c, this.content = c, this.timeStamp = Date.now()
        },b.Event.prototype.stopPropagation = function () {
            this.stopped = !0
        },b.Event.prototype.stopImmediatePropagation = function () {
            this.stoppedImmediate = !0
        },b.autoDetectRenderer = function (a, c, d) {
            a || (a = 800), c || (c = 600);
            var e = function () {
                try {
                    var a = document.createElement("canvas");
                    return !!window.WebGLRenderingContext && (a.getContext("webgl") || a.getContext("experimental-webgl"))
                } catch (b) {
                    return !1
                }
            }();
            return e ? new b.WebGLRenderer(a, c, d) : new b.CanvasRenderer(a, c, d)
        },b.autoDetectRecommendedRenderer = function (a, c, d) {
            a || (a = 800), c || (c = 600);
            var e = function () {
                try {
                    var a = document.createElement("canvas");
                    return !!window.WebGLRenderingContext && (a.getContext("webgl") || a.getContext("experimental-webgl"))
                } catch (b) {
                    return !1
                }
            }(), f = /Android/i.test(navigator.userAgent);
            return e && !f ? new b.WebGLRenderer(a, c, d) : new b.CanvasRenderer(a, c, d)
        },b.PolyK = {},b.PolyK.Triangulate = function (a) {
            var c = !0, d = a.length >> 1;
            if (3 > d) return [];
            for (var e = [], f = [], g = 0; d > g; g++) f.push(g);
            g = 0;
            for (var h = d; h > 3;) {
                var i = f[(g + 0) % h], j = f[(g + 1) % h], k = f[(g + 2) % h], l = a[2 * i], m = a[2 * i + 1],
                        n = a[2 * j], o = a[2 * j + 1], p = a[2 * k], q = a[2 * k + 1], r = !1;
                if (b.PolyK._convex(l, m, n, o, p, q, c)) {
                    r = !0;
                    for (var s = 0; h > s; s++) {
                        var t = f[s];
                        if (t !== i && t !== j && t !== k && b.PolyK._PointInTriangle(a[2 * t], a[2 * t + 1], l, m, n, o, p, q)) {
                            r = !1;
                            break
                        }
                    }
                }
                if (r) e.push(i, j, k), f.splice((g + 1) % h, 1), h--, g = 0; else if (g++ > 3 * h) {
                    if (!c) return null;
                    for (e = [], f = [], g = 0; d > g; g++) f.push(g);
                    g = 0, h = d, c = !1
                }
            }
            return e.push(f[0], f[1], f[2]), e
        },b.PolyK._PointInTriangle = function (a, b, c, d, e, f, g, h) {
            var i = g - c, j = h - d, k = e - c, l = f - d, m = a - c, n = b - d, o = i * i + j * j, p = i * k + j * l,
                    q = i * m + j * n, r = k * k + l * l, s = k * m + l * n, t = 1 / (o * r - p * p),
                    u = (r * q - p * s) * t, v = (o * s - p * q) * t;
            return u >= 0 && v >= 0 && 1 > u + v
        },b.PolyK._convex = function (a, b, c, d, e, f, g) {
            return (b - d) * (e - c) + (c - a) * (f - d) >= 0 === g
        },b.initDefaultShaders = function () {
        },b.CompileVertexShader = function (a, c) {
            return b._CompileShader(a, c, a.VERTEX_SHADER)
        },b.CompileFragmentShader = function (a, c) {
            return b._CompileShader(a, c, a.FRAGMENT_SHADER)
        },b._CompileShader = function (a, b, c) {
            var d = b.join("\n"), e = a.createShader(c);
            return a.shaderSource(e, d), a.compileShader(e), a.getShaderParameter(e, a.COMPILE_STATUS) ? e : (window.console.log(a.getShaderInfoLog(e)), null)
        },b.compileProgram = function (a, c, d) {
            var e = b.CompileFragmentShader(a, d), f = b.CompileVertexShader(a, c), g = a.createProgram();
            return a.attachShader(g, f), a.attachShader(g, e), a.linkProgram(g), a.getProgramParameter(g, a.LINK_STATUS) || window.console.log("Could not initialise shaders"), g
        },b.PixiShader = function (a) {
            this._UID = b._UID++, this.gl = a, this.program = null, this.fragmentSrc = ["precision lowp float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform sampler2D uSampler;", "void main(void) {", "   gl_FragColor = texture2D(uSampler, vTextureCoord) * vColor ;", "}"], this.textureCount = 0, this.firstRun = !0, this.dirty = !0, this.attributes = [], this.init()
        },b.PixiShader.prototype.constructor = b.PixiShader,b.PixiShader.prototype.init = function () {
            var a = this.gl, c = b.compileProgram(a, this.vertexSrc || b.PixiShader.defaultVertexSrc, this.fragmentSrc);
            a.useProgram(c), this.uSampler = a.getUniformLocation(c, "uSampler"), this.projectionVector = a.getUniformLocation(c, "projectionVector"), this.offsetVector = a.getUniformLocation(c, "offsetVector"), this.dimensions = a.getUniformLocation(c, "dimensions"), this.aVertexPosition = a.getAttribLocation(c, "aVertexPosition"), this.aTextureCoord = a.getAttribLocation(c, "aTextureCoord"), this.colorAttribute = a.getAttribLocation(c, "aColor"), -1 === this.colorAttribute && (this.colorAttribute = 2), this.attributes = [this.aVertexPosition, this.aTextureCoord, this.colorAttribute];
            for (var d in this.uniforms) this.uniforms[d].uniformLocation = a.getUniformLocation(c, d);
            this.initUniforms(), this.program = c
        },b.PixiShader.prototype.initUniforms = function () {
            this.textureCount = 1;
            var a, b = this.gl;
            for (var c in this.uniforms) {
                a = this.uniforms[c];
                var d = a.type;
                "sampler2D" === d ? (a._init = !1, null !== a.value && this.initSampler2D(a)) : "mat2" === d || "mat3" === d || "mat4" === d ? (a.glMatrix = !0, a.glValueLength = 1, "mat2" === d ? a.glFunc = b.uniformMatrix2fv : "mat3" === d ? a.glFunc = b.uniformMatrix3fv : "mat4" === d && (a.glFunc = b.uniformMatrix4fv)) : (a.glFunc = b["uniform" + d], a.glValueLength = "2f" === d || "2i" === d ? 2 : "3f" === d || "3i" === d ? 3 : "4f" === d || "4i" === d ? 4 : 1)
            }
        },b.PixiShader.prototype.initSampler2D = function (a) {
            if (a.value && a.value.baseTexture && a.value.baseTexture.hasLoaded) {
                var b = this.gl;
                if (b.activeTexture(b["TEXTURE" + this.textureCount]), b.bindTexture(b.TEXTURE_2D, a.value.baseTexture._glTextures[b.id]), a.textureData) {
                    var c = a.textureData, d = c.magFilter ? c.magFilter : b.LINEAR,
                            e = c.minFilter ? c.minFilter : b.LINEAR, f = c.wrapS ? c.wrapS : b.CLAMP_TO_EDGE,
                            g = c.wrapT ? c.wrapT : b.CLAMP_TO_EDGE, h = c.luminance ? b.LUMINANCE : b.RGBA;
                    if (c.repeat && (f = b.REPEAT, g = b.REPEAT), b.pixelStorei(b.UNPACK_FLIP_Y_WEBGL, !!c.flipY), c.width) {
                        var i = c.width ? c.width : 512, j = c.height ? c.height : 2, k = c.border ? c.border : 0;
                        b.texImage2D(b.TEXTURE_2D, 0, h, i, j, k, h, b.UNSIGNED_BYTE, null)
                    } else b.texImage2D(b.TEXTURE_2D, 0, h, b.RGBA, b.UNSIGNED_BYTE, a.value.baseTexture.source);
                    b.texParameteri(b.TEXTURE_2D, b.TEXTURE_MAG_FILTER, d), b.texParameteri(b.TEXTURE_2D, b.TEXTURE_MIN_FILTER, e), b.texParameteri(b.TEXTURE_2D, b.TEXTURE_WRAP_S, f), b.texParameteri(b.TEXTURE_2D, b.TEXTURE_WRAP_T, g)
                }
                b.uniform1i(a.uniformLocation, this.textureCount), a._init = !0, this.textureCount++
            }
        },b.PixiShader.prototype.syncUniforms = function () {
            this.textureCount = 1;
            var a, c = this.gl;
            for (var d in this.uniforms) a = this.uniforms[d], 1 === a.glValueLength ? a.glMatrix === !0 ? a.glFunc.call(c, a.uniformLocation, a.transpose, a.value) : a.glFunc.call(c, a.uniformLocation, a.value) : 2 === a.glValueLength ? a.glFunc.call(c, a.uniformLocation, a.value.x, a.value.y) : 3 === a.glValueLength ? a.glFunc.call(c, a.uniformLocation, a.value.x, a.value.y, a.value.z) : 4 === a.glValueLength ? a.glFunc.call(c, a.uniformLocation, a.value.x, a.value.y, a.value.z, a.value.w) : "sampler2D" === a.type && (a._init ? (c.activeTexture(c["TEXTURE" + this.textureCount]), a.value.baseTexture._dirty[c.id] ? b.instances[c.id].updateTexture(a.value.baseTexture) : c.bindTexture(c.TEXTURE_2D, a.value.baseTexture._glTextures[c.id]), c.uniform1i(a.uniformLocation, this.textureCount), this.textureCount++) : this.initSampler2D(a))
        },b.PixiShader.prototype.destroy = function () {
            this.gl.deleteProgram(this.program), this.uniforms = null, this.gl = null, this.attributes = null
        },b.PixiShader.defaultVertexSrc = ["attribute vec2 aVertexPosition;", "attribute vec2 aTextureCoord;", "attribute vec4 aColor;", "uniform vec2 projectionVector;", "uniform vec2 offsetVector;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "const vec2 center = vec2(-1.0, 1.0);", "void main(void) {", "   gl_Position = vec4( ((aVertexPosition + offsetVector) / projectionVector) + center , 0.0, 1.0);", "   vTextureCoord = aTextureCoord;", "   vColor = vec4(aColor.rgb * aColor.a, aColor.a);", "}"],b.PixiFastShader = function (a) {
            this._UID = b._UID++, this.gl = a, this.program = null, this.fragmentSrc = ["precision lowp float;", "varying vec2 vTextureCoord;", "varying float vColor;", "uniform sampler2D uSampler;", "void main(void) {", "   gl_FragColor = texture2D(uSampler, vTextureCoord) * vColor ;", "}"], this.vertexSrc = ["attribute vec2 aVertexPosition;", "attribute vec2 aPositionCoord;", "attribute vec2 aScale;", "attribute float aRotation;", "attribute vec2 aTextureCoord;", "attribute float aColor;", "uniform vec2 projectionVector;", "uniform vec2 offsetVector;", "uniform mat3 uMatrix;", "varying vec2 vTextureCoord;", "varying float vColor;", "const vec2 center = vec2(-1.0, 1.0);", "void main(void) {", "   vec2 v;", "   vec2 sv = aVertexPosition * aScale;", "   v.x = (sv.x) * cos(aRotation) - (sv.y) * sin(aRotation);", "   v.y = (sv.x) * sin(aRotation) + (sv.y) * cos(aRotation);", "   v = ( uMatrix * vec3(v + aPositionCoord , 1.0) ).xy ;", "   gl_Position = vec4( ( v / projectionVector) + center , 0.0, 1.0);", "   vTextureCoord = aTextureCoord;", "   vColor = aColor;", "}"], this.textureCount = 0, this.init()
        },b.PixiFastShader.prototype.constructor = b.PixiFastShader,b.PixiFastShader.prototype.init = function () {
            var a = this.gl, c = b.compileProgram(a, this.vertexSrc, this.fragmentSrc);
            a.useProgram(c), this.uSampler = a.getUniformLocation(c, "uSampler"), this.projectionVector = a.getUniformLocation(c, "projectionVector"), this.offsetVector = a.getUniformLocation(c, "offsetVector"), this.dimensions = a.getUniformLocation(c, "dimensions"), this.uMatrix = a.getUniformLocation(c, "uMatrix"), this.aVertexPosition = a.getAttribLocation(c, "aVertexPosition"), this.aPositionCoord = a.getAttribLocation(c, "aPositionCoord"), this.aScale = a.getAttribLocation(c, "aScale"), this.aRotation = a.getAttribLocation(c, "aRotation"), this.aTextureCoord = a.getAttribLocation(c, "aTextureCoord"), this.colorAttribute = a.getAttribLocation(c, "aColor"), -1 === this.colorAttribute && (this.colorAttribute = 2), this.attributes = [this.aVertexPosition, this.aPositionCoord, this.aScale, this.aRotation, this.aTextureCoord, this.colorAttribute], this.program = c
        },b.PixiFastShader.prototype.destroy = function () {
            this.gl.deleteProgram(this.program), this.uniforms = null, this.gl = null, this.attributes = null
        },b.StripShader = function (a) {
            this._UID = b._UID++, this.gl = a, this.program = null, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "uniform float alpha;", "uniform sampler2D uSampler;", "void main(void) {", "   gl_FragColor = texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y)) * alpha;", "}"], this.vertexSrc = ["attribute vec2 aVertexPosition;", "attribute vec2 aTextureCoord;", "uniform mat3 translationMatrix;", "uniform vec2 projectionVector;", "uniform vec2 offsetVector;", "varying vec2 vTextureCoord;", "void main(void) {", "   vec3 v = translationMatrix * vec3(aVertexPosition , 1.0);", "   v -= offsetVector.xyx;", "   gl_Position = vec4( v.x / projectionVector.x -1.0, v.y / -projectionVector.y + 1.0 , 0.0, 1.0);", "   vTextureCoord = aTextureCoord;", "}"], this.init()
        },b.StripShader.prototype.constructor = b.StripShader,b.StripShader.prototype.init = function () {
            var a = this.gl, c = b.compileProgram(a, this.vertexSrc, this.fragmentSrc);
            a.useProgram(c), this.uSampler = a.getUniformLocation(c, "uSampler"), this.projectionVector = a.getUniformLocation(c, "projectionVector"), this.offsetVector = a.getUniformLocation(c, "offsetVector"), this.colorAttribute = a.getAttribLocation(c, "aColor"), this.aVertexPosition = a.getAttribLocation(c, "aVertexPosition"), this.aTextureCoord = a.getAttribLocation(c, "aTextureCoord"), this.attributes = [this.aVertexPosition, this.aTextureCoord], this.translationMatrix = a.getUniformLocation(c, "translationMatrix"), this.alpha = a.getUniformLocation(c, "alpha"), this.program = c
        },b.StripShader.prototype.destroy = function () {
            this.gl.deleteProgram(this.program), this.uniforms = null, this.gl = null, this.attribute = null
        },b.PrimitiveShader = function (a) {
            this._UID = b._UID++, this.gl = a, this.program = null, this.fragmentSrc = ["precision mediump float;", "varying vec4 vColor;", "void main(void) {", "   gl_FragColor = vColor;", "}"], this.vertexSrc = ["attribute vec2 aVertexPosition;", "attribute vec4 aColor;", "uniform mat3 translationMatrix;", "uniform vec2 projectionVector;", "uniform vec2 offsetVector;", "uniform float alpha;", "uniform float flipY;", "uniform vec3 tint;", "varying vec4 vColor;", "void main(void) {", "   vec3 v = translationMatrix * vec3(aVertexPosition , 1.0);", "   v -= offsetVector.xyx;", "   gl_Position = vec4( v.x / projectionVector.x -1.0, (v.y / projectionVector.y * -flipY) + flipY , 0.0, 1.0);", "   vColor = aColor * vec4(tint * alpha, alpha);", "}"], this.init()
        },b.PrimitiveShader.prototype.constructor = b.PrimitiveShader,b.PrimitiveShader.prototype.init = function () {
            var a = this.gl, c = b.compileProgram(a, this.vertexSrc, this.fragmentSrc);
            a.useProgram(c), this.projectionVector = a.getUniformLocation(c, "projectionVector"), this.offsetVector = a.getUniformLocation(c, "offsetVector"), this.tintColor = a.getUniformLocation(c, "tint"), this.flipY = a.getUniformLocation(c, "flipY"), this.aVertexPosition = a.getAttribLocation(c, "aVertexPosition"), this.colorAttribute = a.getAttribLocation(c, "aColor"), this.attributes = [this.aVertexPosition, this.colorAttribute], this.translationMatrix = a.getUniformLocation(c, "translationMatrix"), this.alpha = a.getUniformLocation(c, "alpha"), this.program = c
        },b.PrimitiveShader.prototype.destroy = function () {
            this.gl.deleteProgram(this.program), this.uniforms = null, this.gl = null, this.attributes = null
        },b.ComplexPrimitiveShader = function (a) {
            this._UID = b._UID++, this.gl = a, this.program = null, this.fragmentSrc = ["precision mediump float;", "varying vec4 vColor;", "void main(void) {", "   gl_FragColor = vColor;", "}"], this.vertexSrc = ["attribute vec2 aVertexPosition;", "uniform mat3 translationMatrix;", "uniform vec2 projectionVector;", "uniform vec2 offsetVector;", "uniform vec3 tint;", "uniform float alpha;", "uniform vec3 color;", "uniform float flipY;", "varying vec4 vColor;", "void main(void) {", "   vec3 v = translationMatrix * vec3(aVertexPosition , 1.0);", "   v -= offsetVector.xyx;", "   gl_Position = vec4( v.x / projectionVector.x -1.0, (v.y / projectionVector.y * -flipY) + flipY , 0.0, 1.0);", "   vColor = vec4(color * alpha * tint, alpha);", "}"], this.init()
        },b.ComplexPrimitiveShader.prototype.constructor = b.ComplexPrimitiveShader,b.ComplexPrimitiveShader.prototype.init = function () {
            var a = this.gl, c = b.compileProgram(a, this.vertexSrc, this.fragmentSrc);
            a.useProgram(c), this.projectionVector = a.getUniformLocation(c, "projectionVector"), this.offsetVector = a.getUniformLocation(c, "offsetVector"), this.tintColor = a.getUniformLocation(c, "tint"), this.color = a.getUniformLocation(c, "color"), this.flipY = a.getUniformLocation(c, "flipY"), this.aVertexPosition = a.getAttribLocation(c, "aVertexPosition"), this.attributes = [this.aVertexPosition, this.colorAttribute], this.translationMatrix = a.getUniformLocation(c, "translationMatrix"), this.alpha = a.getUniformLocation(c, "alpha"), this.program = c
        },b.ComplexPrimitiveShader.prototype.destroy = function () {
            this.gl.deleteProgram(this.program), this.uniforms = null, this.gl = null, this.attribute = null
        },b.WebGLGraphics = function () {
        },b.WebGLGraphics.renderGraphics = function (a, c) {
            var d, e = c.gl, f = c.projection, g = c.offset, h = c.shaderManager.primitiveShader;
            a.dirty && b.WebGLGraphics.updateGraphics(a, e);
            for (var i = a._webGL[e.id], j = 0; j < i.data.length; j++) 1 === i.data[j].mode ? (d = i.data[j], c.stencilManager.pushStencil(a, d, c), e.drawElements(e.TRIANGLE_FAN, 4, e.UNSIGNED_SHORT, 2 * (d.indices.length - 4)), c.stencilManager.popStencil(a, d, c)) : (d = i.data[j], c.shaderManager.setShader(h), h = c.shaderManager.primitiveShader, e.uniformMatrix3fv(h.translationMatrix, !1, a.worldTransform.toArray(!0)), e.uniform1f(h.flipY, 1), e.uniform2f(h.projectionVector, f.x, -f.y), e.uniform2f(h.offsetVector, -g.x, -g.y), e.uniform3fv(h.tintColor, b.hex2rgb(a.tint)), e.uniform1f(h.alpha, a.worldAlpha), e.bindBuffer(e.ARRAY_BUFFER, d.buffer), e.vertexAttribPointer(h.aVertexPosition, 2, e.FLOAT, !1, 24, 0), e.vertexAttribPointer(h.colorAttribute, 4, e.FLOAT, !1, 24, 8), e.bindBuffer(e.ELEMENT_ARRAY_BUFFER, d.indexBuffer), e.drawElements(e.TRIANGLE_STRIP, d.indices.length, e.UNSIGNED_SHORT, 0))
        },b.WebGLGraphics.updateGraphics = function (a, c) {
            var d = a._webGL[c.id];
            d || (d = a._webGL[c.id] = {lastIndex: 0, data: [], gl: c}), a.dirty = !1;
            var e;
            if (a.clearDirty) {
                for (a.clearDirty = !1, e = 0; e < d.data.length; e++) {
                    var f = d.data[e];
                    f.reset(), b.WebGLGraphics.graphicsDataPool.push(f)
                }
                d.data = [], d.lastIndex = 0
            }
            var g;
            for (e = d.lastIndex; e < a.graphicsData.length; e++) {
                var h = a.graphicsData[e];
                if (h.type === b.Graphics.POLY) {
                    if (h.points = h.shape.points.slice(), h.shape.closed && (h.points[0] !== h.points[h.points.length - 2] || h.points[1] !== h.points[h.points.length - 1]) && h.points.push(h.points[0], h.points[1]), h.fill && h.points.length >= 6) if (h.points.length < 12) {
                        g = b.WebGLGraphics.switchMode(d, 0);
                        var i = b.WebGLGraphics.buildPoly(h, g);
                        i || (g = b.WebGLGraphics.switchMode(d, 1), b.WebGLGraphics.buildComplexPoly(h, g))
                    } else g = b.WebGLGraphics.switchMode(d, 1), b.WebGLGraphics.buildComplexPoly(h, g);
                    h.lineWidth > 0 && (g = b.WebGLGraphics.switchMode(d, 0), b.WebGLGraphics.buildLine(h, g))
                } else g = b.WebGLGraphics.switchMode(d, 0), h.type === b.Graphics.RECT ? b.WebGLGraphics.buildRectangle(h, g) : h.type === b.Graphics.CIRC || h.type === b.Graphics.ELIP ? b.WebGLGraphics.buildCircle(h, g) : h.type === b.Graphics.RREC && b.WebGLGraphics.buildRoundedRectangle(h, g);
                d.lastIndex++
            }
            for (e = 0; e < d.data.length; e++) g = d.data[e], g.dirty && g.upload()
        },b.WebGLGraphics.switchMode = function (a, c) {
            var d;
            return a.data.length ? (d = a.data[a.data.length - 1], (d.mode !== c || 1 === c) && (d = b.WebGLGraphics.graphicsDataPool.pop() || new b.WebGLGraphicsData(a.gl), d.mode = c, a.data.push(d))) : (d = b.WebGLGraphics.graphicsDataPool.pop() || new b.WebGLGraphicsData(a.gl), d.mode = c, a.data.push(d)), d.dirty = !0, d
        },b.WebGLGraphics.buildRectangle = function (a, c) {
            var d = a.shape, e = d.x, f = d.y, g = d.width, h = d.height;
            if (a.fill) {
                var i = b.hex2rgb(a.fillColor), j = a.fillAlpha, k = i[0] * j, l = i[1] * j, m = i[2] * j, n = c.points,
                        o = c.indices, p = n.length / 6;
                n.push(e, f), n.push(k, l, m, j), n.push(e + g, f), n.push(k, l, m, j), n.push(e, f + h), n.push(k, l, m, j), n.push(e + g, f + h), n.push(k, l, m, j), o.push(p, p, p + 1, p + 2, p + 3, p + 3)
            }
            if (a.lineWidth) {
                var q = a.points;
                a.points = [e, f, e + g, f, e + g, f + h, e, f + h, e, f], b.WebGLGraphics.buildLine(a, c), a.points = q
            }
        },b.WebGLGraphics.buildRoundedRectangle = function (a, c) {
            var d = a.shape, e = d.x, f = d.y, g = d.width, h = d.height, i = d.radius, j = [];
            if (j.push(e, f + i), j = j.concat(b.WebGLGraphics.quadraticBezierCurve(e, f + h - i, e, f + h, e + i, f + h)), j = j.concat(b.WebGLGraphics.quadraticBezierCurve(e + g - i, f + h, e + g, f + h, e + g, f + h - i)), j = j.concat(b.WebGLGraphics.quadraticBezierCurve(e + g, f + i, e + g, f, e + g - i, f)), j = j.concat(b.WebGLGraphics.quadraticBezierCurve(e + i, f, e, f, e, f + i)), a.fill) {
                var k = b.hex2rgb(a.fillColor), l = a.fillAlpha, m = k[0] * l, n = k[1] * l, o = k[2] * l, p = c.points,
                        q = c.indices, r = p.length / 6, s = b.PolyK.Triangulate(j), t = 0;
                for (t = 0; t < s.length; t += 3) q.push(s[t] + r), q.push(s[t] + r), q.push(s[t + 1] + r), q.push(s[t + 2] + r), q.push(s[t + 2] + r);
                for (t = 0; t < j.length; t++) p.push(j[t], j[++t], m, n, o, l)
            }
            if (a.lineWidth) {
                var u = a.points;
                a.points = j, b.WebGLGraphics.buildLine(a, c), a.points = u
            }
        },b.WebGLGraphics.quadraticBezierCurve = function (a, b, c, d, e, f) {
            function g(a, b, c) {
                var d = b - a;
                return a + d * c
            }

            for (var h, i, j, k, l, m, n = 20, o = [], p = 0, q = 0; n >= q; q++) p = q / n, h = g(a, c, p), i = g(b, d, p), j = g(c, e, p), k = g(d, f, p), l = g(h, j, p), m = g(i, k, p), o.push(l, m);
            return o
        },b.WebGLGraphics.buildCircle = function (a, c) {
            var d, e, f = a.shape, g = f.x, h = f.y;
            a.type === b.Graphics.CIRC ? (d = f.radius, e = f.radius) : (d = f.width, e = f.height);
            var i = 40, j = 2 * Math.PI / i, k = 0;
            if (a.fill) {
                var l = b.hex2rgb(a.fillColor), m = a.fillAlpha, n = l[0] * m, o = l[1] * m, p = l[2] * m, q = c.points,
                        r = c.indices, s = q.length / 6;
                for (r.push(s), k = 0; i + 1 > k; k++) q.push(g, h, n, o, p, m), q.push(g + Math.sin(j * k) * d, h + Math.cos(j * k) * e, n, o, p, m), r.push(s++, s++);
                r.push(s - 1)
            }
            if (a.lineWidth) {
                var t = a.points;
                for (a.points = [], k = 0; i + 1 > k; k++) a.points.push(g + Math.sin(j * k) * d, h + Math.cos(j * k) * e);
                b.WebGLGraphics.buildLine(a, c), a.points = t
            }
        },b.WebGLGraphics.buildLine = function (a, c) {
            var d = 0, e = a.points;
            if (0 !== e.length) {
                if (a.lineWidth % 2) for (d = 0; d < e.length; d++) e[d] += .5;
                var f = new b.Point(e[0], e[1]), g = new b.Point(e[e.length - 2], e[e.length - 1]);
                if (f.x === g.x && f.y === g.y) {
                    e = e.slice(), e.pop(), e.pop(), g = new b.Point(e[e.length - 2], e[e.length - 1]);
                    var h = g.x + .5 * (f.x - g.x), i = g.y + .5 * (f.y - g.y);
                    e.unshift(h, i), e.push(h, i)
                }
                var j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, A, B, C, D, E, F, G = c.points, H = c.indices,
                        I = e.length / 2, J = e.length, K = G.length / 6, L = a.lineWidth / 2,
                        M = b.hex2rgb(a.lineColor), N = a.lineAlpha, O = M[0] * N, P = M[1] * N, Q = M[2] * N;
                for (l = e[0], m = e[1], n = e[2], o = e[3], r = -(m - o), s = l - n, F = Math.sqrt(r * r + s * s), r /= F, s /= F, r *= L, s *= L, G.push(l - r, m - s, O, P, Q, N), G.push(l + r, m + s, O, P, Q, N), d = 1; I - 1 > d; d++) l = e[2 * (d - 1)], m = e[2 * (d - 1) + 1], n = e[2 * d], o = e[2 * d + 1], p = e[2 * (d + 1)], q = e[2 * (d + 1) + 1], r = -(m - o), s = l - n, F = Math.sqrt(r * r + s * s), r /= F, s /= F, r *= L, s *= L, t = -(o - q), u = n - p, F = Math.sqrt(t * t + u * u), t /= F, u /= F, t *= L, u *= L, x = -s + m - (-s + o), y = -r + n - (-r + l), z = (-r + l) * (-s + o) - (-r + n) * (-s + m), A = -u + q - (-u + o), B = -t + n - (-t + p), C = (-t + p) * (-u + o) - (-t + n) * (-u + q), D = x * B - A * y, Math.abs(D) < .1 ? (D += 10.1, G.push(n - r, o - s, O, P, Q, N), G.push(n + r, o + s, O, P, Q, N)) : (j = (y * C - B * z) / D, k = (A * z - x * C) / D, E = (j - n) * (j - n) + (k - o) + (k - o), E > 19600 ? (v = r - t, w = s - u, F = Math.sqrt(v * v + w * w), v /= F, w /= F, v *= L, w *= L, G.push(n - v, o - w), G.push(O, P, Q, N), G.push(n + v, o + w), G.push(O, P, Q, N), G.push(n - v, o - w), G.push(O, P, Q, N), J++) : (G.push(j, k), G.push(O, P, Q, N), G.push(n - (j - n), o - (k - o)), G.push(O, P, Q, N)));
                for (l = e[2 * (I - 2)], m = e[2 * (I - 2) + 1], n = e[2 * (I - 1)], o = e[2 * (I - 1) + 1], r = -(m - o), s = l - n, F = Math.sqrt(r * r + s * s), r /= F, s /= F, r *= L, s *= L, G.push(n - r, o - s), G.push(O, P, Q, N), G.push(n + r, o + s), G.push(O, P, Q, N), H.push(K), d = 0; J > d; d++) H.push(K++);
                H.push(K - 1)
            }
        },b.WebGLGraphics.buildComplexPoly = function (a, c) {
            var d = a.points.slice();
            if (!(d.length < 6)) {
                var e = c.indices;
                c.points = d, c.alpha = a.fillAlpha, c.color = b.hex2rgb(a.fillColor);
                for (var f, g, h = 1 / 0, i = -1 / 0, j = 1 / 0, k = -1 / 0, l = 0; l < d.length; l += 2) f = d[l], g = d[l + 1], h = h > f ? f : h, i = f > i ? f : i, j = j > g ? g : j, k = g > k ? g : k;
                d.push(h, j, i, j, i, k, h, k);
                var m = d.length / 2;
                for (l = 0; m > l; l++) e.push(l)
            }
        },b.WebGLGraphics.buildPoly = function (a, c) {
            var d = a.points;
            if (!(d.length < 6)) {
                var e = c.points, f = c.indices, g = d.length / 2, h = b.hex2rgb(a.fillColor), i = a.fillAlpha,
                        j = h[0] * i, k = h[1] * i, l = h[2] * i, m = b.PolyK.Triangulate(d);
                if (!m) return !1;
                var n = e.length / 6, o = 0;
                for (o = 0; o < m.length; o += 3) f.push(m[o] + n), f.push(m[o] + n), f.push(m[o + 1] + n), f.push(m[o + 2] + n), f.push(m[o + 2] + n);
                for (o = 0; g > o; o++) e.push(d[2 * o], d[2 * o + 1], j, k, l, i);
                return !0
            }
        },b.WebGLGraphics.graphicsDataPool = [],b.WebGLGraphicsData = function (a) {
            this.gl = a, this.color = [0, 0, 0], this.points = [], this.indices = [], this.buffer = a.createBuffer(), this.indexBuffer = a.createBuffer(), this.mode = 1, this.alpha = 1, this.dirty = !0
        },b.WebGLGraphicsData.prototype.reset = function () {
            this.points = [], this.indices = []
        },b.WebGLGraphicsData.prototype.upload = function () {
            var a = this.gl;
            this.glPoints = new b.Float32Array(this.points), a.bindBuffer(a.ARRAY_BUFFER, this.buffer), a.bufferData(a.ARRAY_BUFFER, this.glPoints, a.STATIC_DRAW), this.glIndicies = new b.Uint16Array(this.indices), a.bindBuffer(a.ELEMENT_ARRAY_BUFFER, this.indexBuffer), a.bufferData(a.ELEMENT_ARRAY_BUFFER, this.glIndicies, a.STATIC_DRAW), this.dirty = !1
        },b.glContexts = [],b.instances = [],b.WebGLRenderer = function (a, c, d) {
            if (d) for (var e in b.defaultRenderOptions) "undefined" == typeof d[e] && (d[e] = b.defaultRenderOptions[e]); else d = b.defaultRenderOptions;
            b.defaultRenderer || (b.sayHello("webGL"), b.defaultRenderer = this), this.type = b.WEBGL_RENDERER, this.resolution = d.resolution, this.transparent = d.transparent, this.autoResize = d.autoResize || !1, this.preserveDrawingBuffer = d.preserveDrawingBuffer, this.clearBeforeRender = d.clearBeforeRender, this.width = a || 800, this.height = c || 600, this.view = d.view || document.createElement("canvas"), this.contextLostBound = this.handleContextLost.bind(this), this.contextRestoredBound = this.handleContextRestored.bind(this), this.view.addEventListener("webglcontextlost", this.contextLostBound, !1), this.view.addEventListener("webglcontextrestored", this.contextRestoredBound, !1), this._contextOptions = {
                alpha: this.transparent,
                antialias: d.antialias,
                premultipliedAlpha: this.transparent && "notMultiplied" !== this.transparent,
                stencil: !0,
                preserveDrawingBuffer: d.preserveDrawingBuffer
            }, this.projection = new b.Point, this.offset = new b.Point(0, 0), this.shaderManager = new b.WebGLShaderManager, this.spriteBatch = new b.WebGLSpriteBatch, this.maskManager = new b.WebGLMaskManager, this.filterManager = new b.WebGLFilterManager, this.stencilManager = new b.WebGLStencilManager, this.blendModeManager = new b.WebGLBlendModeManager, this.renderSession = {}, this.renderSession.gl = this.gl, this.renderSession.drawCount = 0, this.renderSession.shaderManager = this.shaderManager, this.renderSession.maskManager = this.maskManager, this.renderSession.filterManager = this.filterManager, this.renderSession.blendModeManager = this.blendModeManager, this.renderSession.spriteBatch = this.spriteBatch, this.renderSession.stencilManager = this.stencilManager, this.renderSession.renderer = this, this.renderSession.resolution = this.resolution, this.initContext(), this.mapBlendModes()
        },b.WebGLRenderer.prototype.constructor = b.WebGLRenderer,b.WebGLRenderer.prototype.initContext = function () {
            var a = this.view.getContext("webgl", this._contextOptions) || this.view.getContext("experimental-webgl", this._contextOptions);
            if (this.gl = a, !a) throw new Error("This browser does not support webGL. Try using the canvas renderer");
            this.glContextId = a.id = b.WebGLRenderer.glContextId++, b.glContexts[this.glContextId] = a, b.instances[this.glContextId] = this, a.disable(a.DEPTH_TEST), a.disable(a.CULL_FACE), a.enable(a.BLEND), this.shaderManager.setContext(a), this.spriteBatch.setContext(a), this.maskManager.setContext(a), this.filterManager.setContext(a), this.blendModeManager.setContext(a), this.stencilManager.setContext(a), this.renderSession.gl = this.gl, this.resize(this.width, this.height)
        },b.WebGLRenderer.prototype.render = function (a) {
            if (!this.contextLost) {
                this.__stage !== a && (a.interactive && a.interactionManager.removeEvents(), this.__stage = a), a.updateTransform();
                var b = this.gl;
                a._interactive ? a._interactiveEventsAdded || (a._interactiveEventsAdded = !0, a.interactionManager.setTarget(this)) : a._interactiveEventsAdded && (a._interactiveEventsAdded = !1, a.interactionManager.setTarget(this)), b.viewport(0, 0, this.width, this.height), b.bindFramebuffer(b.FRAMEBUFFER, null), this.clearBeforeRender && (this.transparent ? b.clearColor(0, 0, 0, 0) : b.clearColor(a.backgroundColorSplit[0], a.backgroundColorSplit[1], a.backgroundColorSplit[2], 1), b.clear(b.COLOR_BUFFER_BIT)), this.renderDisplayObject(a, this.projection)
            }
        },b.WebGLRenderer.prototype.renderDisplayObject = function (a, c, d) {
            this.renderSession.blendModeManager.setBlendMode(b.blendModes.NORMAL), this.renderSession.drawCount = 0, this.renderSession.flipY = d ? -1 : 1, this.renderSession.projection = c, this.renderSession.offset = this.offset, this.spriteBatch.begin(this.renderSession), this.filterManager.begin(this.renderSession, d), a._renderWebGL(this.renderSession), this.spriteBatch.end()
        },b.WebGLRenderer.prototype.resize = function (a, b) {
            this.width = a * this.resolution, this.height = b * this.resolution, this.view.width = this.width, this.view.height = this.height, this.autoResize && (this.view.style.width = this.width / this.resolution + "px", this.view.style.height = this.height / this.resolution + "px"), this.gl.viewport(0, 0, this.width, this.height), this.projection.x = this.width / 2 / this.resolution, this.projection.y = -this.height / 2 / this.resolution
        },b.WebGLRenderer.prototype.updateTexture = function (a) {
            if (a.hasLoaded) {
                var c = this.gl;
                return a._glTextures[c.id] || (a._glTextures[c.id] = c.createTexture()), c.bindTexture(c.TEXTURE_2D, a._glTextures[c.id]), c.pixelStorei(c.UNPACK_PREMULTIPLY_ALPHA_WEBGL, a.premultipliedAlpha), c.texImage2D(c.TEXTURE_2D, 0, c.RGBA, c.RGBA, c.UNSIGNED_BYTE, a.source), c.texParameteri(c.TEXTURE_2D, c.TEXTURE_MAG_FILTER, a.scaleMode === b.scaleModes.LINEAR ? c.LINEAR : c.NEAREST), a.mipmap && b.isPowerOfTwo(a.width, a.height) ? (c.texParameteri(c.TEXTURE_2D, c.TEXTURE_MIN_FILTER, a.scaleMode === b.scaleModes.LINEAR ? c.LINEAR_MIPMAP_LINEAR : c.NEAREST_MIPMAP_NEAREST), c.generateMipmap(c.TEXTURE_2D)) : c.texParameteri(c.TEXTURE_2D, c.TEXTURE_MIN_FILTER, a.scaleMode === b.scaleModes.LINEAR ? c.LINEAR : c.NEAREST), a._powerOf2 ? (c.texParameteri(c.TEXTURE_2D, c.TEXTURE_WRAP_S, c.REPEAT), c.texParameteri(c.TEXTURE_2D, c.TEXTURE_WRAP_T, c.REPEAT)) : (c.texParameteri(c.TEXTURE_2D, c.TEXTURE_WRAP_S, c.CLAMP_TO_EDGE), c.texParameteri(c.TEXTURE_2D, c.TEXTURE_WRAP_T, c.CLAMP_TO_EDGE)), a._dirty[c.id] = !1, a._glTextures[c.id]
            }
        },b.WebGLRenderer.prototype.handleContextLost = function (a) {
            a.preventDefault(), this.contextLost = !0
        },b.WebGLRenderer.prototype.handleContextRestored = function () {
            this.initContext();
            for (var a in b.TextureCache) {
                var c = b.TextureCache[a].baseTexture;
                c._glTextures = []
            }
            this.contextLost = !1
        },b.WebGLRenderer.prototype.destroy = function () {
            this.view.removeEventListener("webglcontextlost", this.contextLostBound), this.view.removeEventListener("webglcontextrestored", this.contextRestoredBound), b.glContexts[this.glContextId] = null, this.projection = null, this.offset = null, this.shaderManager.destroy(), this.spriteBatch.destroy(), this.maskManager.destroy(), this.filterManager.destroy(), this.shaderManager = null, this.spriteBatch = null, this.maskManager = null, this.filterManager = null, this.gl = null, this.renderSession = null
        },b.WebGLRenderer.prototype.mapBlendModes = function () {
            var a = this.gl;
            b.blendModesWebGL || (b.blendModesWebGL = [], b.blendModesWebGL[b.blendModes.NORMAL] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.ADD] = [a.SRC_ALPHA, a.DST_ALPHA], b.blendModesWebGL[b.blendModes.MULTIPLY] = [a.DST_COLOR, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.SCREEN] = [a.SRC_ALPHA, a.ONE], b.blendModesWebGL[b.blendModes.OVERLAY] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.DARKEN] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.LIGHTEN] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.COLOR_DODGE] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.COLOR_BURN] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.HARD_LIGHT] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.SOFT_LIGHT] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.DIFFERENCE] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.EXCLUSION] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.HUE] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.SATURATION] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.COLOR] = [a.ONE, a.ONE_MINUS_SRC_ALPHA], b.blendModesWebGL[b.blendModes.LUMINOSITY] = [a.ONE, a.ONE_MINUS_SRC_ALPHA])
        },b.WebGLRenderer.glContextId = 0,b.WebGLBlendModeManager = function () {
            this.currentBlendMode = 99999
        },b.WebGLBlendModeManager.prototype.constructor = b.WebGLBlendModeManager,b.WebGLBlendModeManager.prototype.setContext = function (a) {
            this.gl = a
        },b.WebGLBlendModeManager.prototype.setBlendMode = function (a) {
            if (this.currentBlendMode === a) return !1;
            this.currentBlendMode = a;
            var c = b.blendModesWebGL[this.currentBlendMode];
            return this.gl.blendFunc(c[0], c[1]), !0
        },b.WebGLBlendModeManager.prototype.destroy = function () {
            this.gl = null
        },b.WebGLMaskManager = function () {
        },b.WebGLMaskManager.prototype.constructor = b.WebGLMaskManager,b.WebGLMaskManager.prototype.setContext = function (a) {
            this.gl = a
        },b.WebGLMaskManager.prototype.pushMask = function (a, c) {
            var d = c.gl;
            a.dirty && b.WebGLGraphics.updateGraphics(a, d), a._webGL[d.id].data.length && c.stencilManager.pushStencil(a, a._webGL[d.id].data[0], c)
        },b.WebGLMaskManager.prototype.popMask = function (a, b) {
            var c = this.gl;
            b.stencilManager.popStencil(a, a._webGL[c.id].data[0], b)
        },b.WebGLMaskManager.prototype.destroy = function () {
            this.gl = null
        },b.WebGLStencilManager = function () {
            this.stencilStack = [], this.reverse = !0, this.count = 0
        },b.WebGLStencilManager.prototype.setContext = function (a) {
            this.gl = a
        },b.WebGLStencilManager.prototype.pushStencil = function (a, b, c) {
            var d = this.gl;
            this.bindGraphics(a, b, c), 0 === this.stencilStack.length && (d.enable(d.STENCIL_TEST), d.clear(d.STENCIL_BUFFER_BIT), this.reverse = !0, this.count = 0), this.stencilStack.push(b);
            var e = this.count;
            d.colorMask(!1, !1, !1, !1), d.stencilFunc(d.ALWAYS, 0, 255), d.stencilOp(d.KEEP, d.KEEP, d.INVERT), 1 === b.mode ? (d.drawElements(d.TRIANGLE_FAN, b.indices.length - 4, d.UNSIGNED_SHORT, 0), this.reverse ? (d.stencilFunc(d.EQUAL, 255 - e, 255), d.stencilOp(d.KEEP, d.KEEP, d.DECR)) : (d.stencilFunc(d.EQUAL, e, 255), d.stencilOp(d.KEEP, d.KEEP, d.INCR)), d.drawElements(d.TRIANGLE_FAN, 4, d.UNSIGNED_SHORT, 2 * (b.indices.length - 4)), this.reverse ? d.stencilFunc(d.EQUAL, 255 - (e + 1), 255) : d.stencilFunc(d.EQUAL, e + 1, 255), this.reverse = !this.reverse) : (this.reverse ? (d.stencilFunc(d.EQUAL, e, 255), d.stencilOp(d.KEEP, d.KEEP, d.INCR)) : (d.stencilFunc(d.EQUAL, 255 - e, 255), d.stencilOp(d.KEEP, d.KEEP, d.DECR)), d.drawElements(d.TRIANGLE_STRIP, b.indices.length, d.UNSIGNED_SHORT, 0), this.reverse ? d.stencilFunc(d.EQUAL, e + 1, 255) : d.stencilFunc(d.EQUAL, 255 - (e + 1), 255)), d.colorMask(!0, !0, !0, !0), d.stencilOp(d.KEEP, d.KEEP, d.KEEP), this.count++
        },b.WebGLStencilManager.prototype.bindGraphics = function (a, c, d) {
            this._currentGraphics = a;
            var e, f = this.gl, g = d.projection, h = d.offset;
            1 === c.mode ? (e = d.shaderManager.complexPrimitiveShader, d.shaderManager.setShader(e), f.uniform1f(e.flipY, d.flipY), f.uniformMatrix3fv(e.translationMatrix, !1, a.worldTransform.toArray(!0)), f.uniform2f(e.projectionVector, g.x, -g.y), f.uniform2f(e.offsetVector, -h.x, -h.y), f.uniform3fv(e.tintColor, b.hex2rgb(a.tint)), f.uniform3fv(e.color, c.color), f.uniform1f(e.alpha, a.worldAlpha * c.alpha), f.bindBuffer(f.ARRAY_BUFFER, c.buffer), f.vertexAttribPointer(e.aVertexPosition, 2, f.FLOAT, !1, 8, 0), f.bindBuffer(f.ELEMENT_ARRAY_BUFFER, c.indexBuffer)) : (e = d.shaderManager.primitiveShader, d.shaderManager.setShader(e), f.uniformMatrix3fv(e.translationMatrix, !1, a.worldTransform.toArray(!0)), f.uniform1f(e.flipY, d.flipY), f.uniform2f(e.projectionVector, g.x, -g.y), f.uniform2f(e.offsetVector, -h.x, -h.y), f.uniform3fv(e.tintColor, b.hex2rgb(a.tint)), f.uniform1f(e.alpha, a.worldAlpha), f.bindBuffer(f.ARRAY_BUFFER, c.buffer), f.vertexAttribPointer(e.aVertexPosition, 2, f.FLOAT, !1, 24, 0), f.vertexAttribPointer(e.colorAttribute, 4, f.FLOAT, !1, 24, 8), f.bindBuffer(f.ELEMENT_ARRAY_BUFFER, c.indexBuffer))
        },b.WebGLStencilManager.prototype.popStencil = function (a, b, c) {
            var d = this.gl;
            if (this.stencilStack.pop(), this.count--, 0 === this.stencilStack.length) d.disable(d.STENCIL_TEST); else {
                var e = this.count;
                this.bindGraphics(a, b, c), d.colorMask(!1, !1, !1, !1), 1 === b.mode ? (this.reverse = !this.reverse, this.reverse ? (d.stencilFunc(d.EQUAL, 255 - (e + 1), 255), d.stencilOp(d.KEEP, d.KEEP, d.INCR)) : (d.stencilFunc(d.EQUAL, e + 1, 255), d.stencilOp(d.KEEP, d.KEEP, d.DECR)), d.drawElements(d.TRIANGLE_FAN, 4, d.UNSIGNED_SHORT, 2 * (b.indices.length - 4)), d.stencilFunc(d.ALWAYS, 0, 255), d.stencilOp(d.KEEP, d.KEEP, d.INVERT), d.drawElements(d.TRIANGLE_FAN, b.indices.length - 4, d.UNSIGNED_SHORT, 0), this.reverse ? d.stencilFunc(d.EQUAL, e, 255) : d.stencilFunc(d.EQUAL, 255 - e, 255)) : (this.reverse ? (d.stencilFunc(d.EQUAL, e + 1, 255), d.stencilOp(d.KEEP, d.KEEP, d.DECR)) : (d.stencilFunc(d.EQUAL, 255 - (e + 1), 255), d.stencilOp(d.KEEP, d.KEEP, d.INCR)), d.drawElements(d.TRIANGLE_STRIP, b.indices.length, d.UNSIGNED_SHORT, 0), this.reverse ? d.stencilFunc(d.EQUAL, e, 255) : d.stencilFunc(d.EQUAL, 255 - e, 255)), d.colorMask(!0, !0, !0, !0), d.stencilOp(d.KEEP, d.KEEP, d.KEEP)
            }
        },b.WebGLStencilManager.prototype.destroy = function () {
            this.stencilStack = null, this.gl = null
        },b.WebGLShaderManager = function () {
            this.maxAttibs = 10, this.attribState = [], this.tempAttribState = [];
            for (var a = 0; a < this.maxAttibs; a++) this.attribState[a] = !1;
            this.stack = []
        },b.WebGLShaderManager.prototype.constructor = b.WebGLShaderManager,b.WebGLShaderManager.prototype.setContext = function (a) {
            this.gl = a, this.primitiveShader = new b.PrimitiveShader(a), this.complexPrimitiveShader = new b.ComplexPrimitiveShader(a), this.defaultShader = new b.PixiShader(a), this.fastShader = new b.PixiFastShader(a), this.stripShader = new b.StripShader(a), this.setShader(this.defaultShader)
        },b.WebGLShaderManager.prototype.setAttribs = function (a) {
            var b;
            for (b = 0; b < this.tempAttribState.length; b++) this.tempAttribState[b] = !1;
            for (b = 0; b < a.length; b++) {
                var c = a[b];
                this.tempAttribState[c] = !0
            }
            var d = this.gl;
            for (b = 0; b < this.attribState.length; b++) this.attribState[b] !== this.tempAttribState[b] && (this.attribState[b] = this.tempAttribState[b], this.tempAttribState[b] ? d.enableVertexAttribArray(b) : d.disableVertexAttribArray(b))
        },b.WebGLShaderManager.prototype.setShader = function (a) {
            return this._currentId === a._UID ? !1 : (this._currentId = a._UID, this.currentShader = a, this.gl.useProgram(a.program), this.setAttribs(a.attributes), !0)
        },b.WebGLShaderManager.prototype.destroy = function () {
            this.attribState = null, this.tempAttribState = null, this.primitiveShader.destroy(), this.complexPrimitiveShader.destroy(), this.defaultShader.destroy(), this.fastShader.destroy(), this.stripShader.destroy(), this.gl = null
        },b.WebGLSpriteBatch = function () {
            this.vertSize = 5, this.size = 2e3;
            var a = 4 * this.size * 4 * this.vertSize, c = 6 * this.size;
            this.vertices = new b.ArrayBuffer(a), this.positions = new b.Float32Array(this.vertices), this.colors = new b.Uint32Array(this.vertices), this.indices = new b.Uint16Array(c), this.lastIndexCount = 0;
            for (var d = 0, e = 0; c > d; d += 6, e += 4) this.indices[d + 0] = e + 0, this.indices[d + 1] = e + 1, this.indices[d + 2] = e + 2, this.indices[d + 3] = e + 0, this.indices[d + 4] = e + 2, this.indices[d + 5] = e + 3;
            this.drawing = !1, this.currentBatchSize = 0, this.currentBaseTexture = null, this.dirty = !0, this.textures = [], this.blendModes = [], this.shaders = [], this.sprites = [], this.defaultShader = new b.AbstractFilter(["precision lowp float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform sampler2D uSampler;", "void main(void) {", "   gl_FragColor = texture2D(uSampler, vTextureCoord) * vColor ;", "}"])
        },b.WebGLSpriteBatch.prototype.setContext = function (a) {
            this.gl = a, this.vertexBuffer = a.createBuffer(), this.indexBuffer = a.createBuffer(), a.bindBuffer(a.ELEMENT_ARRAY_BUFFER, this.indexBuffer), a.bufferData(a.ELEMENT_ARRAY_BUFFER, this.indices, a.STATIC_DRAW), a.bindBuffer(a.ARRAY_BUFFER, this.vertexBuffer), a.bufferData(a.ARRAY_BUFFER, this.vertices, a.DYNAMIC_DRAW), this.currentBlendMode = 99999;
            var c = new b.PixiShader(a);
            c.fragmentSrc = this.defaultShader.fragmentSrc, c.uniforms = {}, c.init(), this.defaultShader.shaders[a.id] = c
        },b.WebGLSpriteBatch.prototype.begin = function (a) {
            this.renderSession = a, this.shader = this.renderSession.shaderManager.defaultShader, this.start()
        },b.WebGLSpriteBatch.prototype.end = function () {
            this.flush()
        },b.WebGLSpriteBatch.prototype.render = function (a) {
            var b = a.texture;
            this.currentBatchSize >= this.size && (this.flush(), this.currentBaseTexture = b.baseTexture);
            var c = b._uvs;
            if (c) {
                var d, e, f, g, h = a.anchor.x, i = a.anchor.y;
                if (b.trim) {
                    var j = b.trim;
                    e = j.x - h * j.width, d = e + b.crop.width, g = j.y - i * j.height, f = g + b.crop.height
                } else d = b.frame.width * (1 - h), e = b.frame.width * -h, f = b.frame.height * (1 - i), g = b.frame.height * -i;
                var k = 4 * this.currentBatchSize * this.vertSize, l = b.baseTexture.resolution, m = a.worldTransform,
                        n = m.a / l, o = m.b / l, p = m.c / l, q = m.d / l, r = m.tx, s = m.ty, t = this.colors,
                        u = this.positions;
                this.renderSession.roundPixels ? (u[k] = n * e + p * g + r | 0, u[k + 1] = q * g + o * e + s | 0, u[k + 5] = n * d + p * g + r | 0, u[k + 6] = q * g + o * d + s | 0, u[k + 10] = n * d + p * f + r | 0, u[k + 11] = q * f + o * d + s | 0, u[k + 15] = n * e + p * f + r | 0, u[k + 16] = q * f + o * e + s | 0) : (u[k] = n * e + p * g + r, u[k + 1] = q * g + o * e + s, u[k + 5] = n * d + p * g + r, u[k + 6] = q * g + o * d + s, u[k + 10] = n * d + p * f + r, u[k + 11] = q * f + o * d + s, u[k + 15] = n * e + p * f + r, u[k + 16] = q * f + o * e + s), u[k + 2] = c.x0, u[k + 3] = c.y0, u[k + 7] = c.x1, u[k + 8] = c.y1, u[k + 12] = c.x2, u[k + 13] = c.y2, u[k + 17] = c.x3, u[k + 18] = c.y3;
                var v = a.tint;
                t[k + 4] = t[k + 9] = t[k + 14] = t[k + 19] = (v >> 16) + (65280 & v) + ((255 & v) << 16) + (255 * a.worldAlpha << 24), this.sprites[this.currentBatchSize++] = a
            }
        },b.WebGLSpriteBatch.prototype.renderTilingSprite = function (a) {
            var c = a.tilingTexture;
            this.currentBatchSize >= this.size && (this.flush(), this.currentBaseTexture = c.baseTexture), a._uvs || (a._uvs = new b.TextureUvs);
            var d = a._uvs;
            a.tilePosition.x %= c.baseTexture.width * a.tileScaleOffset.x, a.tilePosition.y %= c.baseTexture.height * a.tileScaleOffset.y;
            var e = a.tilePosition.x / (c.baseTexture.width * a.tileScaleOffset.x),
                    f = a.tilePosition.y / (c.baseTexture.height * a.tileScaleOffset.y),
                    g = a.width / c.baseTexture.width / (a.tileScale.x * a.tileScaleOffset.x),
                    h = a.height / c.baseTexture.height / (a.tileScale.y * a.tileScaleOffset.y);
            d.x0 = 0 - e, d.y0 = 0 - f, d.x1 = 1 * g - e, d.y1 = 0 - f, d.x2 = 1 * g - e, d.y2 = 1 * h - f, d.x3 = 0 - e, d.y3 = 1 * h - f;
            var i = a.tint, j = (i >> 16) + (65280 & i) + ((255 & i) << 16) + (255 * a.alpha << 24), k = this.positions,
                    l = this.colors, m = a.width, n = a.height, o = a.anchor.x, p = a.anchor.y, q = m * (1 - o),
                    r = m * -o, s = n * (1 - p), t = n * -p, u = 4 * this.currentBatchSize * this.vertSize,
                    v = c.baseTexture.resolution, w = a.worldTransform, x = w.a / v, y = w.b / v, z = w.c / v,
                    A = w.d / v, B = w.tx, C = w.ty;
            k[u++] = x * r + z * t + B, k[u++] = A * t + y * r + C, k[u++] = d.x0, k[u++] = d.y0, l[u++] = j, k[u++] = x * q + z * t + B, k[u++] = A * t + y * q + C, k[u++] = d.x1, k[u++] = d.y1, l[u++] = j, k[u++] = x * q + z * s + B, k[u++] = A * s + y * q + C, k[u++] = d.x2, k[u++] = d.y2, l[u++] = j, k[u++] = x * r + z * s + B, k[u++] = A * s + y * r + C, k[u++] = d.x3, k[u++] = d.y3, l[u++] = j, this.sprites[this.currentBatchSize++] = a
        },b.WebGLSpriteBatch.prototype.flush = function () {
            if (0 !== this.currentBatchSize) {
                var a, c = this.gl;
                if (this.dirty) {
                    this.dirty = !1, c.activeTexture(c.TEXTURE0), c.bindBuffer(c.ARRAY_BUFFER, this.vertexBuffer), c.bindBuffer(c.ELEMENT_ARRAY_BUFFER, this.indexBuffer), a = this.defaultShader.shaders[c.id];
                    var d = 4 * this.vertSize;
                    c.vertexAttribPointer(a.aVertexPosition, 2, c.FLOAT, !1, d, 0), c.vertexAttribPointer(a.aTextureCoord, 2, c.FLOAT, !1, d, 8), c.vertexAttribPointer(a.colorAttribute, 4, c.UNSIGNED_BYTE, !0, d, 16)
                }
                if (this.currentBatchSize > .5 * this.size) c.bufferSubData(c.ARRAY_BUFFER, 0, this.vertices); else {
                    var e = this.positions.subarray(0, 4 * this.currentBatchSize * this.vertSize);
                    c.bufferSubData(c.ARRAY_BUFFER, 0, e)
                }
                for (var f, g, h, i, j = 0, k = 0, l = null, m = this.renderSession.blendModeManager.currentBlendMode, n = null, o = !1, p = !1, q = 0, r = this.currentBatchSize; r > q; q++) {
                    if (i = this.sprites[q], f = i.texture.baseTexture, g = i.blendMode, h = i.shader || this.defaultShader, o = m !== g, p = n !== h, (l !== f || o || p) && (this.renderBatch(l, j, k), k = q, j = 0, l = f, o && (m = g, this.renderSession.blendModeManager.setBlendMode(m)), p)) {
                        n = h, a = n.shaders[c.id], a || (a = new b.PixiShader(c), a.fragmentSrc = n.fragmentSrc, a.uniforms = n.uniforms, a.init(), n.shaders[c.id] = a), this.renderSession.shaderManager.setShader(a), a.dirty && a.syncUniforms();
                        var s = this.renderSession.projection;
                        c.uniform2f(a.projectionVector, s.x, s.y);
                        var t = this.renderSession.offset;
                        c.uniform2f(a.offsetVector, t.x, t.y)
                    }
                    j++
                }
                this.renderBatch(l, j, k), this.currentBatchSize = 0
            }
        },b.WebGLSpriteBatch.prototype.renderBatch = function (a, b, c) {
            if (0 !== b) {
                var d = this.gl;
                a._dirty[d.id] ? this.renderSession.renderer.updateTexture(a) : d.bindTexture(d.TEXTURE_2D, a._glTextures[d.id]), d.drawElements(d.TRIANGLES, 6 * b, d.UNSIGNED_SHORT, 6 * c * 2), this.renderSession.drawCount++
            }
        },b.WebGLSpriteBatch.prototype.stop = function () {
            this.flush(), this.dirty = !0
        },b.WebGLSpriteBatch.prototype.start = function () {
            this.dirty = !0
        },b.WebGLSpriteBatch.prototype.destroy = function () {
            this.vertices = null, this.indices = null, this.gl.deleteBuffer(this.vertexBuffer), this.gl.deleteBuffer(this.indexBuffer), this.currentBaseTexture = null, this.gl = null
        },b.WebGLFastSpriteBatch = function (a) {
            this.vertSize = 10, this.maxSize = 6e3, this.size = this.maxSize;
            var c = 4 * this.size * this.vertSize, d = 6 * this.maxSize;
            this.vertices = new b.Float32Array(c), this.indices = new b.Uint16Array(d), this.vertexBuffer = null, this.indexBuffer = null, this.lastIndexCount = 0;
            for (var e = 0, f = 0; d > e; e += 6, f += 4) this.indices[e + 0] = f + 0, this.indices[e + 1] = f + 1, this.indices[e + 2] = f + 2, this.indices[e + 3] = f + 0, this.indices[e + 4] = f + 2, this.indices[e + 5] = f + 3;
            this.drawing = !1, this.currentBatchSize = 0, this.currentBaseTexture = null, this.currentBlendMode = 0, this.renderSession = null, this.shader = null, this.matrix = null, this.setContext(a)
        },b.WebGLFastSpriteBatch.prototype.constructor = b.WebGLFastSpriteBatch,b.WebGLFastSpriteBatch.prototype.setContext = function (a) {
            this.gl = a, this.vertexBuffer = a.createBuffer(), this.indexBuffer = a.createBuffer(), a.bindBuffer(a.ELEMENT_ARRAY_BUFFER, this.indexBuffer), a.bufferData(a.ELEMENT_ARRAY_BUFFER, this.indices, a.STATIC_DRAW), a.bindBuffer(a.ARRAY_BUFFER, this.vertexBuffer), a.bufferData(a.ARRAY_BUFFER, this.vertices, a.DYNAMIC_DRAW)
        },b.WebGLFastSpriteBatch.prototype.begin = function (a, b) {
            this.renderSession = b, this.shader = this.renderSession.shaderManager.fastShader, this.matrix = a.worldTransform.toArray(!0), this.start()
        },b.WebGLFastSpriteBatch.prototype.end = function () {
            this.flush()
        },b.WebGLFastSpriteBatch.prototype.render = function (a) {
            var b = a.children, c = b[0];
            if (c.texture._uvs) {
                this.currentBaseTexture = c.texture.baseTexture, c.blendMode !== this.renderSession.blendModeManager.currentBlendMode && (this.flush(), this.renderSession.blendModeManager.setBlendMode(c.blendMode));
                for (var d = 0, e = b.length; e > d; d++) this.renderSprite(b[d]);
                this.flush()
            }
        },b.WebGLFastSpriteBatch.prototype.renderSprite = function (a) {
            if (a.visible && (a.texture.baseTexture === this.currentBaseTexture || (this.flush(), this.currentBaseTexture = a.texture.baseTexture, a.texture._uvs))) {
                var b, c, d, e, f, g, h, i, j = this.vertices;
                if (b = a.texture._uvs, c = a.texture.frame.width, d = a.texture.frame.height, a.texture.trim) {
                    var k = a.texture.trim;
                    f = k.x - a.anchor.x * k.width, e = f + a.texture.crop.width, h = k.y - a.anchor.y * k.height, g = h + a.texture.crop.height
                } else e = a.texture.frame.width * (1 - a.anchor.x), f = a.texture.frame.width * -a.anchor.x, g = a.texture.frame.height * (1 - a.anchor.y), h = a.texture.frame.height * -a.anchor.y;
                i = 4 * this.currentBatchSize * this.vertSize, j[i++] = f, j[i++] = h, j[i++] = a.position.x, j[i++] = a.position.y, j[i++] = a.scale.x, j[i++] = a.scale.y, j[i++] = a.rotation, j[i++] = b.x0, j[i++] = b.y1, j[i++] = a.alpha, j[i++] = e, j[i++] = h, j[i++] = a.position.x, j[i++] = a.position.y, j[i++] = a.scale.x, j[i++] = a.scale.y, j[i++] = a.rotation, j[i++] = b.x1, j[i++] = b.y1, j[i++] = a.alpha, j[i++] = e, j[i++] = g, j[i++] = a.position.x, j[i++] = a.position.y, j[i++] = a.scale.x, j[i++] = a.scale.y, j[i++] = a.rotation, j[i++] = b.x2, j[i++] = b.y2, j[i++] = a.alpha, j[i++] = f, j[i++] = g, j[i++] = a.position.x, j[i++] = a.position.y, j[i++] = a.scale.x, j[i++] = a.scale.y, j[i++] = a.rotation, j[i++] = b.x3, j[i++] = b.y3, j[i++] = a.alpha, this.currentBatchSize++, this.currentBatchSize >= this.size && this.flush()
            }
        },b.WebGLFastSpriteBatch.prototype.flush = function () {
            if (0 !== this.currentBatchSize) {
                var a = this.gl;
                if (this.currentBaseTexture._glTextures[a.id] || this.renderSession.renderer.updateTexture(this.currentBaseTexture, a), a.bindTexture(a.TEXTURE_2D, this.currentBaseTexture._glTextures[a.id]), this.currentBatchSize > .5 * this.size) a.bufferSubData(a.ARRAY_BUFFER, 0, this.vertices); else {
                    var b = this.vertices.subarray(0, 4 * this.currentBatchSize * this.vertSize);
                    a.bufferSubData(a.ARRAY_BUFFER, 0, b)
                }
                a.drawElements(a.TRIANGLES, 6 * this.currentBatchSize, a.UNSIGNED_SHORT, 0), this.currentBatchSize = 0, this.renderSession.drawCount++
            }
        },b.WebGLFastSpriteBatch.prototype.stop = function () {
            this.flush()
        },b.WebGLFastSpriteBatch.prototype.start = function () {
            var a = this.gl;
            a.activeTexture(a.TEXTURE0), a.bindBuffer(a.ARRAY_BUFFER, this.vertexBuffer), a.bindBuffer(a.ELEMENT_ARRAY_BUFFER, this.indexBuffer);
            var b = this.renderSession.projection;
            a.uniform2f(this.shader.projectionVector, b.x, b.y), a.uniformMatrix3fv(this.shader.uMatrix, !1, this.matrix);
            var c = 4 * this.vertSize;
            a.vertexAttribPointer(this.shader.aVertexPosition, 2, a.FLOAT, !1, c, 0), a.vertexAttribPointer(this.shader.aPositionCoord, 2, a.FLOAT, !1, c, 8), a.vertexAttribPointer(this.shader.aScale, 2, a.FLOAT, !1, c, 16), a.vertexAttribPointer(this.shader.aRotation, 1, a.FLOAT, !1, c, 24), a.vertexAttribPointer(this.shader.aTextureCoord, 2, a.FLOAT, !1, c, 28), a.vertexAttribPointer(this.shader.colorAttribute, 1, a.FLOAT, !1, c, 36)
        },b.WebGLFilterManager = function () {
            this.filterStack = [], this.offsetX = 0, this.offsetY = 0
        },b.WebGLFilterManager.prototype.constructor = b.WebGLFilterManager,b.WebGLFilterManager.prototype.setContext = function (a) {
            this.gl = a, this.texturePool = [], this.initShaderBuffers()
        },b.WebGLFilterManager.prototype.begin = function (a, b) {
            this.renderSession = a, this.defaultShader = a.shaderManager.defaultShader;
            var c = this.renderSession.projection;
            this.width = 2 * c.x, this.height = 2 * -c.y, this.buffer = b
        },b.WebGLFilterManager.prototype.pushFilter = function (a) {
            var c = this.gl, d = this.renderSession.projection, e = this.renderSession.offset;
            a._filterArea = a.target.filterArea || a.target.getBounds(), this.filterStack.push(a);
            var f = a.filterPasses[0];
            this.offsetX += a._filterArea.x, this.offsetY += a._filterArea.y;
            var g = this.texturePool.pop();
            g ? g.resize(this.width, this.height) : g = new b.FilterTexture(this.gl, this.width, this.height), c.bindTexture(c.TEXTURE_2D, g.texture);
            var h = a._filterArea, i = f.padding;
            h.x -= i, h.y -= i, h.width += 2 * i, h.height += 2 * i, h.x < 0 && (h.x = 0), h.width > this.width && (h.width = this.width), h.y < 0 && (h.y = 0), h.height > this.height && (h.height = this.height), c.bindFramebuffer(c.FRAMEBUFFER, g.frameBuffer), c.viewport(0, 0, h.width, h.height), d.x = h.width / 2, d.y = -h.height / 2, e.x = -h.x, e.y = -h.y, c.colorMask(!0, !0, !0, !0), c.clearColor(0, 0, 0, 0), c.clear(c.COLOR_BUFFER_BIT), a._glFilterTexture = g
        },b.WebGLFilterManager.prototype.popFilter = function () {
            var a = this.gl, c = this.filterStack.pop(), d = c._filterArea, e = c._glFilterTexture,
                    f = this.renderSession.projection, g = this.renderSession.offset;
            if (c.filterPasses.length > 1) {
                a.viewport(0, 0, d.width, d.height), a.bindBuffer(a.ARRAY_BUFFER, this.vertexBuffer), this.vertexArray[0] = 0, this.vertexArray[1] = d.height, this.vertexArray[2] = d.width, this.vertexArray[3] = d.height, this.vertexArray[4] = 0, this.vertexArray[5] = 0, this.vertexArray[6] = d.width, this.vertexArray[7] = 0, a.bufferSubData(a.ARRAY_BUFFER, 0, this.vertexArray), a.bindBuffer(a.ARRAY_BUFFER, this.uvBuffer), this.uvArray[2] = d.width / this.width, this.uvArray[5] = d.height / this.height, this.uvArray[6] = d.width / this.width, this.uvArray[7] = d.height / this.height, a.bufferSubData(a.ARRAY_BUFFER, 0, this.uvArray);
                var h = e, i = this.texturePool.pop();
                i || (i = new b.FilterTexture(this.gl, this.width, this.height)), i.resize(this.width, this.height), a.bindFramebuffer(a.FRAMEBUFFER, i.frameBuffer), a.clear(a.COLOR_BUFFER_BIT), a.disable(a.BLEND);
                for (var j = 0; j < c.filterPasses.length - 1; j++) {
                    var k = c.filterPasses[j];
                    a.bindFramebuffer(a.FRAMEBUFFER, i.frameBuffer), a.activeTexture(a.TEXTURE0), a.bindTexture(a.TEXTURE_2D, h.texture), this.applyFilterPass(k, d, d.width, d.height);
                    var l = h;
                    h = i, i = l
                }
                a.enable(a.BLEND), e = h, this.texturePool.push(i)
            }
            var m = c.filterPasses[c.filterPasses.length - 1];
            this.offsetX -= d.x, this.offsetY -= d.y;
            var n = this.width, o = this.height, p = 0, q = 0, r = this.buffer;
            if (0 === this.filterStack.length) a.colorMask(!0, !0, !0, !0); else {
                var s = this.filterStack[this.filterStack.length - 1];
                d = s._filterArea, n = d.width, o = d.height, p = d.x, q = d.y, r = s._glFilterTexture.frameBuffer
            }
            f.x = n / 2, f.y = -o / 2, g.x = p, g.y = q, d = c._filterArea;
            var t = d.x - p, u = d.y - q;
            a.bindBuffer(a.ARRAY_BUFFER, this.vertexBuffer), this.vertexArray[0] = t, this.vertexArray[1] = u + d.height, this.vertexArray[2] = t + d.width, this.vertexArray[3] = u + d.height, this.vertexArray[4] = t, this.vertexArray[5] = u, this.vertexArray[6] = t + d.width, this.vertexArray[7] = u, a.bufferSubData(a.ARRAY_BUFFER, 0, this.vertexArray), a.bindBuffer(a.ARRAY_BUFFER, this.uvBuffer), this.uvArray[2] = d.width / this.width, this.uvArray[5] = d.height / this.height, this.uvArray[6] = d.width / this.width, this.uvArray[7] = d.height / this.height, a.bufferSubData(a.ARRAY_BUFFER, 0, this.uvArray), a.viewport(0, 0, n, o), a.bindFramebuffer(a.FRAMEBUFFER, r), a.activeTexture(a.TEXTURE0), a.bindTexture(a.TEXTURE_2D, e.texture), this.applyFilterPass(m, d, n, o), this.texturePool.push(e), c._glFilterTexture = null
        },b.WebGLFilterManager.prototype.applyFilterPass = function (a, c, d, e) {
            var f = this.gl, g = a.shaders[f.id];
            g || (g = new b.PixiShader(f), g.fragmentSrc = a.fragmentSrc, g.uniforms = a.uniforms, g.init(), a.shaders[f.id] = g), this.renderSession.shaderManager.setShader(g), f.uniform2f(g.projectionVector, d / 2, -e / 2), f.uniform2f(g.offsetVector, 0, 0), a.uniforms.dimensions && (a.uniforms.dimensions.value[0] = this.width, a.uniforms.dimensions.value[1] = this.height, a.uniforms.dimensions.value[2] = this.vertexArray[0], a.uniforms.dimensions.value[3] = this.vertexArray[5]), g.syncUniforms(), f.bindBuffer(f.ARRAY_BUFFER, this.vertexBuffer), f.vertexAttribPointer(g.aVertexPosition, 2, f.FLOAT, !1, 0, 0), f.bindBuffer(f.ARRAY_BUFFER, this.uvBuffer), f.vertexAttribPointer(g.aTextureCoord, 2, f.FLOAT, !1, 0, 0), f.bindBuffer(f.ARRAY_BUFFER, this.colorBuffer), f.vertexAttribPointer(g.colorAttribute, 2, f.FLOAT, !1, 0, 0), f.bindBuffer(f.ELEMENT_ARRAY_BUFFER, this.indexBuffer), f.drawElements(f.TRIANGLES, 6, f.UNSIGNED_SHORT, 0), this.renderSession.drawCount++
        },b.WebGLFilterManager.prototype.initShaderBuffers = function () {
            var a = this.gl;
            this.vertexBuffer = a.createBuffer(), this.uvBuffer = a.createBuffer(), this.colorBuffer = a.createBuffer(), this.indexBuffer = a.createBuffer(), this.vertexArray = new b.Float32Array([0, 0, 1, 0, 0, 1, 1, 1]), a.bindBuffer(a.ARRAY_BUFFER, this.vertexBuffer), a.bufferData(a.ARRAY_BUFFER, this.vertexArray, a.STATIC_DRAW), this.uvArray = new b.Float32Array([0, 0, 1, 0, 0, 1, 1, 1]), a.bindBuffer(a.ARRAY_BUFFER, this.uvBuffer), a.bufferData(a.ARRAY_BUFFER, this.uvArray, a.STATIC_DRAW), this.colorArray = new b.Float32Array([1, 16777215, 1, 16777215, 1, 16777215, 1, 16777215]), a.bindBuffer(a.ARRAY_BUFFER, this.colorBuffer), a.bufferData(a.ARRAY_BUFFER, this.colorArray, a.STATIC_DRAW), a.bindBuffer(a.ELEMENT_ARRAY_BUFFER, this.indexBuffer), a.bufferData(a.ELEMENT_ARRAY_BUFFER, new Uint16Array([0, 1, 2, 1, 3, 2]), a.STATIC_DRAW)
        },b.WebGLFilterManager.prototype.destroy = function () {
            var a = this.gl;
            this.filterStack = null, this.offsetX = 0, this.offsetY = 0;
            for (var b = 0; b < this.texturePool.length; b++) this.texturePool[b].destroy();
            this.texturePool = null, a.deleteBuffer(this.vertexBuffer), a.deleteBuffer(this.uvBuffer), a.deleteBuffer(this.colorBuffer), a.deleteBuffer(this.indexBuffer)
        },b.FilterTexture = function (a, c, d, e) {
            this.gl = a, this.frameBuffer = a.createFramebuffer(), this.texture = a.createTexture(), e = e || b.scaleModes.DEFAULT, a.bindTexture(a.TEXTURE_2D, this.texture), a.texParameteri(a.TEXTURE_2D, a.TEXTURE_MAG_FILTER, e === b.scaleModes.LINEAR ? a.LINEAR : a.NEAREST), a.texParameteri(a.TEXTURE_2D, a.TEXTURE_MIN_FILTER, e === b.scaleModes.LINEAR ? a.LINEAR : a.NEAREST), a.texParameteri(a.TEXTURE_2D, a.TEXTURE_WRAP_S, a.CLAMP_TO_EDGE), a.texParameteri(a.TEXTURE_2D, a.TEXTURE_WRAP_T, a.CLAMP_TO_EDGE), a.bindFramebuffer(a.FRAMEBUFFER, this.frameBuffer), a.bindFramebuffer(a.FRAMEBUFFER, this.frameBuffer), a.framebufferTexture2D(a.FRAMEBUFFER, a.COLOR_ATTACHMENT0, a.TEXTURE_2D, this.texture, 0), this.renderBuffer = a.createRenderbuffer(), a.bindRenderbuffer(a.RENDERBUFFER, this.renderBuffer), a.framebufferRenderbuffer(a.FRAMEBUFFER, a.DEPTH_STENCIL_ATTACHMENT, a.RENDERBUFFER, this.renderBuffer), this.resize(c, d)
        },b.FilterTexture.prototype.constructor = b.FilterTexture,b.FilterTexture.prototype.clear = function () {
            var a = this.gl;
            a.clearColor(0, 0, 0, 0), a.clear(a.COLOR_BUFFER_BIT)
        },b.FilterTexture.prototype.resize = function (a, b) {
            if (this.width !== a || this.height !== b) {
                this.width = a, this.height = b;
                var c = this.gl;
                c.bindTexture(c.TEXTURE_2D, this.texture), c.texImage2D(c.TEXTURE_2D, 0, c.RGBA, a, b, 0, c.RGBA, c.UNSIGNED_BYTE, null), c.bindRenderbuffer(c.RENDERBUFFER, this.renderBuffer), c.renderbufferStorage(c.RENDERBUFFER, c.DEPTH_STENCIL, a, b)
            }
        },b.FilterTexture.prototype.destroy = function () {
            var a = this.gl;
            a.deleteFramebuffer(this.frameBuffer), a.deleteTexture(this.texture), this.frameBuffer = null, this.texture = null
        },b.CanvasBuffer = function (a, b) {
            this.width = a, this.height = b, this.canvas = document.createElement("canvas"), this.context = this.canvas.getContext("2d"), this.canvas.width = a, this.canvas.height = b
        },b.CanvasBuffer.prototype.constructor = b.CanvasBuffer,b.CanvasBuffer.prototype.clear = function () {
            this.context.setTransform(1, 0, 0, 1, 0, 0), this.context.clearRect(0, 0, this.width, this.height)
        },b.CanvasBuffer.prototype.resize = function (a, b) {
            this.width = this.canvas.width = a, this.height = this.canvas.height = b
        },b.CanvasMaskManager = function () {
        },b.CanvasMaskManager.prototype.constructor = b.CanvasMaskManager,b.CanvasMaskManager.prototype.pushMask = function (a, c) {
            var d = c.context;
            d.save();
            var e = a.alpha, f = a.worldTransform, g = c.resolution;
            d.setTransform(f.a * g, f.b * g, f.c * g, f.d * g, f.tx * g, f.ty * g), b.CanvasGraphics.renderGraphicsMask(a, d), d.clip(), a.worldAlpha = e
        },b.CanvasMaskManager.prototype.popMask = function (a) {
            a.context.restore()
        },b.CanvasTinter = function () {
        },b.CanvasTinter.getTintedTexture = function (a, c) {
            var d = a.texture;
            c = b.CanvasTinter.roundColor(c);
            var e = "#" + ("00000" + (0 | c).toString(16)).substr(-6);
            if (d.tintCache = d.tintCache || {}, d.tintCache[e]) return d.tintCache[e];
            var f = b.CanvasTinter.canvas || document.createElement("canvas");
            if (b.CanvasTinter.tintMethod(d, c, f), b.CanvasTinter.convertTintToImage) {
                var g = new Image;
                g.src = f.toDataURL(), d.tintCache[e] = g
            } else d.tintCache[e] = f, b.CanvasTinter.canvas = null;
            return f
        },b.CanvasTinter.tintWithMultiply = function (a, b, c) {
            var d = c.getContext("2d"), e = a.crop;
            c.width = e.width, c.height = e.height, d.fillStyle = "#" + ("00000" + (0 | b).toString(16)).substr(-6), d.fillRect(0, 0, e.width, e.height), d.globalCompositeOperation = "multiply", d.drawImage(a.baseTexture.source, e.x, e.y, e.width, e.height, 0, 0, e.width, e.height), d.globalCompositeOperation = "destination-atop", d.drawImage(a.baseTexture.source, e.x, e.y, e.width, e.height, 0, 0, e.width, e.height)
        },b.CanvasTinter.tintWithOverlay = function (a, b, c) {
            var d = c.getContext("2d"), e = a.crop;
            c.width = e.width, c.height = e.height, d.globalCompositeOperation = "copy", d.fillStyle = "#" + ("00000" + (0 | b).toString(16)).substr(-6), d.fillRect(0, 0, e.width, e.height), d.globalCompositeOperation = "destination-atop", d.drawImage(a.baseTexture.source, e.x, e.y, e.width, e.height, 0, 0, e.width, e.height)
        },b.CanvasTinter.tintWithPerPixel = function (a, c, d) {
            var e = d.getContext("2d"), f = a.crop;
            d.width = f.width, d.height = f.height, e.globalCompositeOperation = "copy", e.drawImage(a.baseTexture.source, f.x, f.y, f.width, f.height, 0, 0, f.width, f.height);
            for (var g = b.hex2rgb(c), h = g[0], i = g[1], j = g[2], k = e.getImageData(0, 0, f.width, f.height), l = k.data, m = 0; m < l.length; m += 4) l[m + 0] *= h, l[m + 1] *= i, l[m + 2] *= j;
            e.putImageData(k, 0, 0)
        },b.CanvasTinter.roundColor = function (a) {
            var c = b.CanvasTinter.cacheStepsPerColorChannel, d = b.hex2rgb(a);
            return d[0] = Math.min(255, d[0] / c * c), d[1] = Math.min(255, d[1] / c * c), d[2] = Math.min(255, d[2] / c * c), b.rgb2hex(d)
        },b.CanvasTinter.cacheStepsPerColorChannel = 8,b.CanvasTinter.convertTintToImage = !1,b.CanvasTinter.canUseMultiply = b.canUseNewCanvasBlendModes(),b.CanvasTinter.tintMethod = b.CanvasTinter.canUseMultiply ? b.CanvasTinter.tintWithMultiply : b.CanvasTinter.tintWithPerPixel,b.CanvasRenderer = function (a, c, d) {
            if (d) for (var e in b.defaultRenderOptions) "undefined" == typeof d[e] && (d[e] = b.defaultRenderOptions[e]); else d = b.defaultRenderOptions;
            b.defaultRenderer || (b.sayHello("Canvas"), b.defaultRenderer = this), this.type = b.CANVAS_RENDERER, this.resolution = d.resolution, this.clearBeforeRender = d.clearBeforeRender, this.transparent = d.transparent, this.autoResize = d.autoResize || !1, this.width = a || 800, this.height = c || 600, this.width *= this.resolution, this.height *= this.resolution, this.view = d.view || document.createElement("canvas"), this.context = this.view.getContext("2d", {alpha: this.transparent}), this.refresh = !0, this.view.width = this.width * this.resolution, this.view.height = this.height * this.resolution, this.count = 0, this.maskManager = new b.CanvasMaskManager, this.renderSession = {
                context: this.context,
                maskManager: this.maskManager,
                scaleMode: null,
                smoothProperty: null,
                roundPixels: !1
            }, this.mapBlendModes(), this.resize(a, c), "imageSmoothingEnabled" in this.context ? this.renderSession.smoothProperty = "imageSmoothingEnabled" : "webkitImageSmoothingEnabled" in this.context ? this.renderSession.smoothProperty = "webkitImageSmoothingEnabled" : "mozImageSmoothingEnabled" in this.context ? this.renderSession.smoothProperty = "mozImageSmoothingEnabled" : "oImageSmoothingEnabled" in this.context ? this.renderSession.smoothProperty = "oImageSmoothingEnabled" : "msImageSmoothingEnabled" in this.context && (this.renderSession.smoothProperty = "msImageSmoothingEnabled")
        },b.CanvasRenderer.prototype.constructor = b.CanvasRenderer,b.CanvasRenderer.prototype.render = function (a) {
            a.updateTransform(), this.context.setTransform(1, 0, 0, 1, 0, 0), this.context.globalAlpha = 1, this.renderSession.currentBlendMode = b.blendModes.NORMAL, this.context.globalCompositeOperation = b.blendModesCanvas[b.blendModes.NORMAL], navigator.isCocoonJS && this.view.screencanvas && (this.context.fillStyle = "black", this.context.clear()), this.clearBeforeRender && (this.transparent ? this.context.clearRect(0, 0, this.width, this.height) : (this.context.fillStyle = a.backgroundColorString, this.context.fillRect(0, 0, this.width, this.height))), this.renderDisplayObject(a), a.interactive && (a._interactiveEventsAdded || (a._interactiveEventsAdded = !0, a.interactionManager.setTarget(this)))
        },b.CanvasRenderer.prototype.destroy = function (a) {
            "undefined" == typeof a && (a = !0), a && this.view.parent && this.view.parent.removeChild(this.view), this.view = null, this.context = null, this.maskManager = null, this.renderSession = null
        },b.CanvasRenderer.prototype.resize = function (a, b) {
            this.width = a * this.resolution, this.height = b * this.resolution, this.view.width = this.width, this.view.height = this.height, this.autoResize && (this.view.style.width = this.width / this.resolution + "px", this.view.style.height = this.height / this.resolution + "px")
        },b.CanvasRenderer.prototype.renderDisplayObject = function (a, b) {
            this.renderSession.context = b || this.context, this.renderSession.resolution = this.resolution, a._renderCanvas(this.renderSession)
        },b.CanvasRenderer.prototype.mapBlendModes = function () {
            b.blendModesCanvas || (b.blendModesCanvas = [], b.canUseNewCanvasBlendModes() ? (b.blendModesCanvas[b.blendModes.NORMAL] = "source-over", b.blendModesCanvas[b.blendModes.ADD] = "lighter", b.blendModesCanvas[b.blendModes.MULTIPLY] = "multiply", b.blendModesCanvas[b.blendModes.SCREEN] = "screen", b.blendModesCanvas[b.blendModes.OVERLAY] = "overlay", b.blendModesCanvas[b.blendModes.DARKEN] = "darken", b.blendModesCanvas[b.blendModes.LIGHTEN] = "lighten", b.blendModesCanvas[b.blendModes.COLOR_DODGE] = "color-dodge", b.blendModesCanvas[b.blendModes.COLOR_BURN] = "color-burn", b.blendModesCanvas[b.blendModes.HARD_LIGHT] = "hard-light", b.blendModesCanvas[b.blendModes.SOFT_LIGHT] = "soft-light", b.blendModesCanvas[b.blendModes.DIFFERENCE] = "difference", b.blendModesCanvas[b.blendModes.EXCLUSION] = "exclusion", b.blendModesCanvas[b.blendModes.HUE] = "hue", b.blendModesCanvas[b.blendModes.SATURATION] = "saturation", b.blendModesCanvas[b.blendModes.COLOR] = "color", b.blendModesCanvas[b.blendModes.LUMINOSITY] = "luminosity") : (b.blendModesCanvas[b.blendModes.NORMAL] = "source-over", b.blendModesCanvas[b.blendModes.ADD] = "lighter", b.blendModesCanvas[b.blendModes.MULTIPLY] = "source-over", b.blendModesCanvas[b.blendModes.SCREEN] = "source-over", b.blendModesCanvas[b.blendModes.OVERLAY] = "source-over", b.blendModesCanvas[b.blendModes.DARKEN] = "source-over", b.blendModesCanvas[b.blendModes.LIGHTEN] = "source-over", b.blendModesCanvas[b.blendModes.COLOR_DODGE] = "source-over", b.blendModesCanvas[b.blendModes.COLOR_BURN] = "source-over", b.blendModesCanvas[b.blendModes.HARD_LIGHT] = "source-over", b.blendModesCanvas[b.blendModes.SOFT_LIGHT] = "source-over", b.blendModesCanvas[b.blendModes.DIFFERENCE] = "source-over", b.blendModesCanvas[b.blendModes.EXCLUSION] = "source-over", b.blendModesCanvas[b.blendModes.HUE] = "source-over", b.blendModesCanvas[b.blendModes.SATURATION] = "source-over", b.blendModesCanvas[b.blendModes.COLOR] = "source-over", b.blendModesCanvas[b.blendModes.LUMINOSITY] = "source-over"))
        },b.CanvasGraphics = function () {
        },b.CanvasGraphics.renderGraphics = function (a, c) {
            var d = a.worldAlpha;
            a.dirty && (this.updateGraphicsTint(a), a.dirty = !1);
            for (var e = 0; e < a.graphicsData.length; e++) {
                var f = a.graphicsData[e], g = f.shape, h = f._fillTint, i = f._lineTint;
                if (c.lineWidth = f.lineWidth, f.type === b.Graphics.POLY) {
                    c.beginPath();
                    var j = g.points;
                    c.moveTo(j[0], j[1]);
                    for (var k = 1; k < j.length / 2; k++) c.lineTo(j[2 * k], j[2 * k + 1]);
                    g.closed && c.lineTo(j[0], j[1]), j[0] === j[j.length - 2] && j[1] === j[j.length - 1] && c.closePath(), f.fill && (c.globalAlpha = f.fillAlpha * d, c.fillStyle = "#" + ("00000" + (0 | h).toString(16)).substr(-6), c.fill()), f.lineWidth && (c.globalAlpha = f.lineAlpha * d, c.strokeStyle = "#" + ("00000" + (0 | i).toString(16)).substr(-6), c.stroke())
                } else if (f.type === b.Graphics.RECT) (f.fillColor || 0 === f.fillColor) && (c.globalAlpha = f.fillAlpha * d, c.fillStyle = "#" + ("00000" + (0 | h).toString(16)).substr(-6), c.fillRect(g.x, g.y, g.width, g.height)), f.lineWidth && (c.globalAlpha = f.lineAlpha * d, c.strokeStyle = "#" + ("00000" + (0 | i).toString(16)).substr(-6), c.strokeRect(g.x, g.y, g.width, g.height)); else if (f.type === b.Graphics.CIRC) c.beginPath(), c.arc(g.x, g.y, g.radius, 0, 2 * Math.PI), c.closePath(), f.fill && (c.globalAlpha = f.fillAlpha * d, c.fillStyle = "#" + ("00000" + (0 | h).toString(16)).substr(-6), c.fill()), f.lineWidth && (c.globalAlpha = f.lineAlpha * d, c.strokeStyle = "#" + ("00000" + (0 | i).toString(16)).substr(-6), c.stroke()); else if (f.type === b.Graphics.ELIP) {
                    var l = 2 * g.width, m = 2 * g.height, n = g.x - l / 2, o = g.y - m / 2;
                    c.beginPath();
                    var p = .5522848, q = l / 2 * p, r = m / 2 * p, s = n + l, t = o + m, u = n + l / 2, v = o + m / 2;
                    c.moveTo(n, v), c.bezierCurveTo(n, v - r, u - q, o, u, o), c.bezierCurveTo(u + q, o, s, v - r, s, v), c.bezierCurveTo(s, v + r, u + q, t, u, t), c.bezierCurveTo(u - q, t, n, v + r, n, v), c.closePath(), f.fill && (c.globalAlpha = f.fillAlpha * d, c.fillStyle = "#" + ("00000" + (0 | h).toString(16)).substr(-6), c.fill()), f.lineWidth && (c.globalAlpha = f.lineAlpha * d, c.strokeStyle = "#" + ("00000" + (0 | i).toString(16)).substr(-6), c.stroke())
                } else if (f.type === b.Graphics.RREC) {
                    var w = g.x, x = g.y, y = g.width, z = g.height, A = g.radius, B = Math.min(y, z) / 2 | 0;
                    A = A > B ? B : A, c.beginPath(), c.moveTo(w, x + A), c.lineTo(w, x + z - A), c.quadraticCurveTo(w, x + z, w + A, x + z), c.lineTo(w + y - A, x + z), c.quadraticCurveTo(w + y, x + z, w + y, x + z - A), c.lineTo(w + y, x + A), c.quadraticCurveTo(w + y, x, w + y - A, x), c.lineTo(w + A, x), c.quadraticCurveTo(w, x, w, x + A), c.closePath(), (f.fillColor || 0 === f.fillColor) && (c.globalAlpha = f.fillAlpha * d, c.fillStyle = "#" + ("00000" + (0 | h).toString(16)).substr(-6), c.fill()), f.lineWidth && (c.globalAlpha = f.lineAlpha * d, c.strokeStyle = "#" + ("00000" + (0 | i).toString(16)).substr(-6), c.stroke())
                }
            }
        },b.CanvasGraphics.renderGraphicsMask = function (a, c) {
            var d = a.graphicsData.length;
            if (0 !== d) {
                d > 1 && (d = 1, window.console.log("Pixi.js warning: masks in canvas can only mask using the first path in the graphics object"));
                for (var e = 0; 1 > e; e++) {
                    var f = a.graphicsData[e], g = f.shape;
                    if (f.type === b.Graphics.POLY) {
                        c.beginPath();
                        var h = g.points;
                        c.moveTo(h[0], h[1]);
                        for (var i = 1; i < h.length / 2; i++) c.lineTo(h[2 * i], h[2 * i + 1]);
                        h[0] === h[h.length - 2] && h[1] === h[h.length - 1] && c.closePath()
                    } else if (f.type === b.Graphics.RECT) c.beginPath(), c.rect(g.x, g.y, g.width, g.height), c.closePath(); else if (f.type === b.Graphics.CIRC) c.beginPath(), c.arc(g.x, g.y, g.radius, 0, 2 * Math.PI), c.closePath(); else if (f.type === b.Graphics.ELIP) {
                        var j = 2 * g.width, k = 2 * g.height, l = g.x - j / 2, m = g.y - k / 2;
                        c.beginPath();
                        var n = .5522848, o = j / 2 * n, p = k / 2 * n, q = l + j, r = m + k, s = l + j / 2,
                                t = m + k / 2;
                        c.moveTo(l, t), c.bezierCurveTo(l, t - p, s - o, m, s, m), c.bezierCurveTo(s + o, m, q, t - p, q, t), c.bezierCurveTo(q, t + p, s + o, r, s, r), c.bezierCurveTo(s - o, r, l, t + p, l, t), c.closePath()
                    } else if (f.type === b.Graphics.RREC) {
                        var u = g.points, v = u[0], w = u[1], x = u[2], y = u[3], z = u[4], A = Math.min(x, y) / 2 | 0;
                        z = z > A ? A : z, c.beginPath(), c.moveTo(v, w + z), c.lineTo(v, w + y - z), c.quadraticCurveTo(v, w + y, v + z, w + y), c.lineTo(v + x - z, w + y), c.quadraticCurveTo(v + x, w + y, v + x, w + y - z), c.lineTo(v + x, w + z), c.quadraticCurveTo(v + x, w, v + x - z, w), c.lineTo(v + z, w), c.quadraticCurveTo(v, w, v, w + z), c.closePath()
                    }
                }
            }
        },b.CanvasGraphics.updateGraphicsTint = function (a) {
            if (16777215 !== a.tint) for (var b = (a.tint >> 16 & 255) / 255, c = (a.tint >> 8 & 255) / 255, d = (255 & a.tint) / 255, e = 0; e < a.graphicsData.length; e++) {
                var f = a.graphicsData[e], g = 0 | f.fillColor, h = 0 | f.lineColor;
                f._fillTint = ((g >> 16 & 255) / 255 * b * 255 << 16) + ((g >> 8 & 255) / 255 * c * 255 << 8) + (255 & g) / 255 * d * 255, f._lineTint = ((h >> 16 & 255) / 255 * b * 255 << 16) + ((h >> 8 & 255) / 255 * c * 255 << 8) + (255 & h) / 255 * d * 255
            }
        },b.Graphics = function () {
            b.DisplayObjectContainer.call(this), this.renderable = !0, this.fillAlpha = 1, this.lineWidth = 0, this.lineColor = 0, this.graphicsData = [], this.tint = 16777215, this.blendMode = b.blendModes.NORMAL, this.currentPath = null, this._webGL = [], this.isMask = !1, this.boundsPadding = 0, this._localBounds = new b.Rectangle(0, 0, 1, 1), this.dirty = !0, this.webGLDirty = !1, this.cachedSpriteDirty = !1
        },b.Graphics.prototype = Object.create(b.DisplayObjectContainer.prototype),b.Graphics.prototype.constructor = b.Graphics,Object.defineProperty(b.Graphics.prototype, "cacheAsBitmap", {
            get: function () {
                return this._cacheAsBitmap
            }, set: function (a) {
                this._cacheAsBitmap = a, this._cacheAsBitmap ? this._generateCachedSprite() : (this.destroyCachedSprite(), this.dirty = !0)
            }
        }),b.Graphics.prototype.lineStyle = function (a, c, d) {
            if (this.lineWidth = a || 0, this.lineColor = c || 0, this.lineAlpha = arguments.length < 3 ? 1 : d, this.currentPath) {
                if (this.currentPath.shape.points.length) return this.drawShape(new b.Polygon(this.currentPath.shape.points.slice(-2))), this;
                this.currentPath.lineWidth = this.lineWidth, this.currentPath.lineColor = this.lineColor, this.currentPath.lineAlpha = this.lineAlpha
            }
            return this
        },b.Graphics.prototype.moveTo = function (a, c) {
            return this.drawShape(new b.Polygon([a, c])), this
        },b.Graphics.prototype.lineTo = function (a, b) {
            return this.currentPath.shape.points.push(a, b), this.dirty = !0, this
        },b.Graphics.prototype.quadraticCurveTo = function (a, b, c, d) {
            this.currentPath ? 0 === this.currentPath.shape.points.length && (this.currentPath.shape.points = [0, 0]) : this.moveTo(0, 0);
            var e, f, g = 20, h = this.currentPath.shape.points;
            0 === h.length && this.moveTo(0, 0);
            for (var i = h[h.length - 2], j = h[h.length - 1], k = 0, l = 1; g >= l; l++) k = l / g, e = i + (a - i) * k, f = j + (b - j) * k, h.push(e + (a + (c - a) * k - e) * k, f + (b + (d - b) * k - f) * k);
            return this.dirty = !0, this
        },b.Graphics.prototype.bezierCurveTo = function (a, b, c, d, e, f) {
            this.currentPath ? 0 === this.currentPath.shape.points.length && (this.currentPath.shape.points = [0, 0]) : this.moveTo(0, 0);
            for (var g, h, i, j, k, l = 20, m = this.currentPath.shape.points, n = m[m.length - 2], o = m[m.length - 1], p = 0, q = 1; l >= q; q++) p = q / l, g = 1 - p, h = g * g, i = h * g, j = p * p, k = j * p, m.push(i * n + 3 * h * p * a + 3 * g * j * c + k * e, i * o + 3 * h * p * b + 3 * g * j * d + k * f);
            return this.dirty = !0, this
        },b.Graphics.prototype.arcTo = function (a, b, c, d, e) {
            this.currentPath ? 0 === this.currentPath.shape.points.length && this.currentPath.shape.points.push(a, b) : this.moveTo(a, b);
            var f = this.currentPath.shape.points, g = f[f.length - 2], h = f[f.length - 1], i = h - b, j = g - a,
                    k = d - b, l = c - a, m = Math.abs(i * l - j * k);
            if (1e-8 > m || 0 === e) (f[f.length - 2] !== a || f[f.length - 1] !== b) && f.push(a, b); else {
                var n = i * i + j * j, o = k * k + l * l, p = i * k + j * l, q = e * Math.sqrt(n) / m,
                        r = e * Math.sqrt(o) / m, s = q * p / n, t = r * p / o, u = q * l + r * j, v = q * k + r * i,
                        w = j * (r + s), x = i * (r + s), y = l * (q + t), z = k * (q + t),
                        A = Math.atan2(x - v, w - u), B = Math.atan2(z - v, y - u);
                this.arc(u + a, v + b, e, A, B, j * k > l * i)
            }
            return this.dirty = !0, this
        },b.Graphics.prototype.arc = function (a, b, c, d, e, f) {
            var g, h = a + Math.cos(d) * c, i = b + Math.sin(d) * c;
            if (this.currentPath ? (g = this.currentPath.shape.points, 0 === g.length ? g.push(h, i) : (g[g.length - 2] !== h || g[g.length - 1] !== i) && g.push(h, i)) : (this.moveTo(h, i), g = this.currentPath.shape.points), d === e) return this;
            !f && d >= e ? e += 2 * Math.PI : f && e >= d && (d += 2 * Math.PI);
            var j = f ? -1 * (d - e) : e - d, k = Math.abs(j) / (2 * Math.PI) * 40;
            if (0 === j) return this;
            for (var l = j / (2 * k), m = 2 * l, n = Math.cos(l), o = Math.sin(l), p = k - 1, q = p % 1 / p, r = 0; p >= r; r++) {
                var s = r + q * r, t = l + d + m * s, u = Math.cos(t), v = -Math.sin(t);
                g.push((n * u + o * v) * c + a, (n * -v + o * u) * c + b)
            }
            return this.dirty = !0, this
        },b.Graphics.prototype.beginFill = function (a, b) {
            return this.filling = !0, this.fillColor = a || 0, this.fillAlpha = void 0 === b ? 1 : b, this.currentPath && this.currentPath.shape.points.length <= 2 && (this.currentPath.fill = this.filling, this.currentPath.fillColor = this.fillColor, this.currentPath.fillAlpha = this.fillAlpha), this
        },b.Graphics.prototype.endFill = function () {
            return this.filling = !1, this.fillColor = null, this.fillAlpha = 1, this
        },b.Graphics.prototype.drawRect = function (a, c, d, e) {
            return this.drawShape(new b.Rectangle(a, c, d, e)), this
        },b.Graphics.prototype.drawRoundedRect = function (a, c, d, e, f) {
            return this.drawShape(new b.RoundedRectangle(a, c, d, e, f)), this
        },b.Graphics.prototype.drawCircle = function (a, c, d) {
            return this.drawShape(new b.Circle(a, c, d)), this
        },b.Graphics.prototype.drawEllipse = function (a, c, d, e) {
            return this.drawShape(new b.Ellipse(a, c, d, e)), this
        },b.Graphics.prototype.drawPolygon = function (a) {
            return a instanceof Array || (a = Array.prototype.slice.call(arguments)), this.drawShape(new b.Polygon(a)), this
        },b.Graphics.prototype.clear = function () {
            return this.lineWidth = 0, this.filling = !1, this.dirty = !0, this.clearDirty = !0, this.graphicsData = [], this
        },b.Graphics.prototype.generateTexture = function (a, c) {
            a = a || 1;
            var d = this.getBounds(), e = new b.CanvasBuffer(d.width * a, d.height * a),
                    f = b.Texture.fromCanvas(e.canvas, c);
            return f.baseTexture.resolution = a, e.context.scale(a, a), e.context.translate(-d.x, -d.y), b.CanvasGraphics.renderGraphics(this, e.context), f
        },b.Graphics.prototype._renderWebGL = function (a) {
            if (this.visible !== !1 && 0 !== this.alpha && this.isMask !== !0) {
                if (this._cacheAsBitmap) return (this.dirty || this.cachedSpriteDirty) && (this._generateCachedSprite(), this.updateCachedSpriteTexture(), this.cachedSpriteDirty = !1, this.dirty = !1), this._cachedSprite.worldAlpha = this.worldAlpha, void b.Sprite.prototype._renderWebGL.call(this._cachedSprite, a);
                if (a.spriteBatch.stop(), a.blendModeManager.setBlendMode(this.blendMode), this._mask && a.maskManager.pushMask(this._mask, a), this._filters && a.filterManager.pushFilter(this._filterBlock), this.blendMode !== a.spriteBatch.currentBlendMode) {
                    a.spriteBatch.currentBlendMode = this.blendMode;
                    var c = b.blendModesWebGL[a.spriteBatch.currentBlendMode];
                    a.spriteBatch.gl.blendFunc(c[0], c[1])
                }
                if (this.webGLDirty && (this.dirty = !0, this.webGLDirty = !1), b.WebGLGraphics.renderGraphics(this, a), this.children.length) {
                    a.spriteBatch.start();
                    for (var d = 0, e = this.children.length; e > d; d++) this.children[d]._renderWebGL(a);
                    a.spriteBatch.stop()
                }
                this._filters && a.filterManager.popFilter(), this._mask && a.maskManager.popMask(this.mask, a), a.drawCount++, a.spriteBatch.start()
            }
        },b.Graphics.prototype._renderCanvas = function (a) {
            if (this.visible !== !1 && 0 !== this.alpha && this.isMask !== !0) {
                if (this._cacheAsBitmap) return (this.dirty || this.cachedSpriteDirty) && (this._generateCachedSprite(), this.updateCachedSpriteTexture(), this.cachedSpriteDirty = !1, this.dirty = !1), this._cachedSprite.alpha = this.alpha, void b.Sprite.prototype._renderCanvas.call(this._cachedSprite, a);
                var c = a.context, d = this.worldTransform;
                this.blendMode !== a.currentBlendMode && (a.currentBlendMode = this.blendMode, c.globalCompositeOperation = b.blendModesCanvas[a.currentBlendMode]), this._mask && a.maskManager.pushMask(this._mask, a);
                var e = a.resolution;
                c.setTransform(d.a * e, d.b * e, d.c * e, d.d * e, d.tx * e, d.ty * e), b.CanvasGraphics.renderGraphics(this, c);
                for (var f = 0, g = this.children.length; g > f; f++) this.children[f]._renderCanvas(a);
                this._mask && a.maskManager.popMask(a)
            }
        },b.Graphics.prototype.getBounds = function (a) {
            if (this.isMask) return b.EmptyRectangle;
            this.dirty && (this.updateLocalBounds(), this.webGLDirty = !0, this.cachedSpriteDirty = !0, this.dirty = !1);
            var c = this._localBounds, d = c.x, e = c.width + c.x, f = c.y, g = c.height + c.y,
                    h = a || this.worldTransform, i = h.a, j = h.b, k = h.c, l = h.d, m = h.tx, n = h.ty,
                    o = i * e + k * g + m, p = l * g + j * e + n, q = i * d + k * g + m, r = l * g + j * d + n,
                    s = i * d + k * f + m, t = l * f + j * d + n, u = i * e + k * f + m, v = l * f + j * e + n, w = o,
                    x = p, y = o, z = p;
            return y = y > q ? q : y, y = y > s ? s : y, y = y > u ? u : y, z = z > r ? r : z, z = z > t ? t : z, z = z > v ? v : z, w = q > w ? q : w, w = s > w ? s : w, w = u > w ? u : w, x = r > x ? r : x, x = t > x ? t : x, x = v > x ? v : x, this._bounds.x = y, this._bounds.width = w - y, this._bounds.y = z, this._bounds.height = x - z, this._bounds
        },b.Graphics.prototype.updateLocalBounds = function () {
            var a = 1 / 0, c = -1 / 0, d = 1 / 0, e = -1 / 0;
            if (this.graphicsData.length) for (var f, g, h, i, j, k, l = 0; l < this.graphicsData.length; l++) {
                var m = this.graphicsData[l], n = m.type, o = m.lineWidth;
                if (f = m.shape, n === b.Graphics.RECT || n === b.Graphics.RREC) h = f.x - o / 2, i = f.y - o / 2, j = f.width + o, k = f.height + o, a = a > h ? h : a, c = h + j > c ? h + j : c, d = d > i ? i : d, e = i + k > e ? i + k : e; else if (n === b.Graphics.CIRC) h = f.x, i = f.y, j = f.radius + o / 2, k = f.radius + o / 2, a = a > h - j ? h - j : a, c = h + j > c ? h + j : c, d = d > i - k ? i - k : d, e = i + k > e ? i + k : e; else if (n === b.Graphics.ELIP) h = f.x, i = f.y, j = f.width + o / 2, k = f.height + o / 2, a = a > h - j ? h - j : a, c = h + j > c ? h + j : c, d = d > i - k ? i - k : d, e = i + k > e ? i + k : e; else {
                    g = f.points;
                    for (var p = 0; p < g.length; p += 2) h = g[p], i = g[p + 1], a = a > h - o ? h - o : a, c = h + o > c ? h + o : c, d = d > i - o ? i - o : d, e = i + o > e ? i + o : e
                }
            } else a = 0, c = 0, d = 0, e = 0;
            var q = this.boundsPadding;
            this._localBounds.x = a - q, this._localBounds.width = c - a + 2 * q, this._localBounds.y = d - q, this._localBounds.height = e - d + 2 * q
        },b.Graphics.prototype._generateCachedSprite = function () {
            var a = this.getLocalBounds();
            if (this._cachedSprite) this._cachedSprite.buffer.resize(a.width, a.height); else {
                var c = new b.CanvasBuffer(a.width, a.height), d = b.Texture.fromCanvas(c.canvas);
                this._cachedSprite = new b.Sprite(d), this._cachedSprite.buffer = c, this._cachedSprite.worldTransform = this.worldTransform
            }
            this._cachedSprite.anchor.x = -(a.x / a.width), this._cachedSprite.anchor.y = -(a.y / a.height), this._cachedSprite.buffer.context.translate(-a.x, -a.y), this.worldAlpha = 1, b.CanvasGraphics.renderGraphics(this, this._cachedSprite.buffer.context), this._cachedSprite.alpha = this.alpha
        },b.Graphics.prototype.updateCachedSpriteTexture = function () {
            var a = this._cachedSprite, b = a.texture, c = a.buffer.canvas;
            b.baseTexture.width = c.width, b.baseTexture.height = c.height, b.crop.width = b.frame.width = c.width, b.crop.height = b.frame.height = c.height, a._width = c.width, a._height = c.height, b.baseTexture.dirty()
        },b.Graphics.prototype.destroyCachedSprite = function () {
            this._cachedSprite.texture.destroy(!0), this._cachedSprite = null
        },b.Graphics.prototype.drawShape = function (a) {
            this.currentPath && this.currentPath.shape.points.length <= 2 && this.graphicsData.pop(), this.currentPath = null;
            var c = new b.GraphicsData(this.lineWidth, this.lineColor, this.lineAlpha, this.fillColor, this.fillAlpha, this.filling, a);
            return this.graphicsData.push(c), c.type === b.Graphics.POLY && (c.shape.closed = this.filling, this.currentPath = c), this.dirty = !0, c
        },b.GraphicsData = function (a, b, c, d, e, f, g) {
            this.lineWidth = a, this.lineColor = b, this.lineAlpha = c, this._lineTint = b, this.fillColor = d, this.fillAlpha = e, this._fillTint = d, this.fill = f, this.shape = g, this.type = g.type
        },b.Graphics.POLY = 0,b.Graphics.RECT = 1,b.Graphics.CIRC = 2,b.Graphics.ELIP = 3,b.Graphics.RREC = 4,b.Polygon.prototype.type = b.Graphics.POLY,b.Rectangle.prototype.type = b.Graphics.RECT,b.Circle.prototype.type = b.Graphics.CIRC,b.Ellipse.prototype.type = b.Graphics.ELIP,b.RoundedRectangle.prototype.type = b.Graphics.RREC,b.Strip = function (a) {
            b.DisplayObjectContainer.call(this), this.texture = a, this.uvs = new b.Float32Array([0, 1, 1, 1, 1, 0, 0, 1]), this.vertices = new b.Float32Array([0, 0, 100, 0, 100, 100, 0, 100]), this.colors = new b.Float32Array([1, 1, 1, 1]), this.indices = new b.Uint16Array([0, 1, 2, 3]), this.dirty = !0, this.blendMode = b.blendModes.NORMAL, this.canvasPadding = 0, this.drawMode = b.Strip.DrawModes.TRIANGLE_STRIP
        },b.Strip.prototype = Object.create(b.DisplayObjectContainer.prototype),b.Strip.prototype.constructor = b.Strip,b.Strip.prototype._renderWebGL = function (a) {
            !this.visible || this.alpha <= 0 || (a.spriteBatch.stop(), this._vertexBuffer || this._initWebGL(a), a.shaderManager.setShader(a.shaderManager.stripShader), this._renderStrip(a), a.spriteBatch.start())
        },b.Strip.prototype._initWebGL = function (a) {
            var b = a.gl;
            this._vertexBuffer = b.createBuffer(), this._indexBuffer = b.createBuffer(), this._uvBuffer = b.createBuffer(), this._colorBuffer = b.createBuffer(), b.bindBuffer(b.ARRAY_BUFFER, this._vertexBuffer), b.bufferData(b.ARRAY_BUFFER, this.vertices, b.DYNAMIC_DRAW), b.bindBuffer(b.ARRAY_BUFFER, this._uvBuffer), b.bufferData(b.ARRAY_BUFFER, this.uvs, b.STATIC_DRAW), b.bindBuffer(b.ARRAY_BUFFER, this._colorBuffer), b.bufferData(b.ARRAY_BUFFER, this.colors, b.STATIC_DRAW), b.bindBuffer(b.ELEMENT_ARRAY_BUFFER, this._indexBuffer), b.bufferData(b.ELEMENT_ARRAY_BUFFER, this.indices, b.STATIC_DRAW)
        },b.Strip.prototype._renderStrip = function (a) {
            var c = a.gl, d = a.projection, e = a.offset, f = a.shaderManager.stripShader,
                    g = this.drawMode === b.Strip.DrawModes.TRIANGLE_STRIP ? c.TRIANGLE_STRIP : c.TRIANGLES;
            a.blendModeManager.setBlendMode(this.blendMode), c.uniformMatrix3fv(f.translationMatrix, !1, this.worldTransform.toArray(!0)), c.uniform2f(f.projectionVector, d.x, -d.y), c.uniform2f(f.offsetVector, -e.x, -e.y), c.uniform1f(f.alpha, this.worldAlpha), this.dirty ? (this.dirty = !1, c.bindBuffer(c.ARRAY_BUFFER, this._vertexBuffer), c.bufferData(c.ARRAY_BUFFER, this.vertices, c.STATIC_DRAW), c.vertexAttribPointer(f.aVertexPosition, 2, c.FLOAT, !1, 0, 0), c.bindBuffer(c.ARRAY_BUFFER, this._uvBuffer), c.bufferData(c.ARRAY_BUFFER, this.uvs, c.STATIC_DRAW), c.vertexAttribPointer(f.aTextureCoord, 2, c.FLOAT, !1, 0, 0), c.activeTexture(c.TEXTURE0), this.texture.baseTexture._dirty[c.id] ? a.renderer.updateTexture(this.texture.baseTexture) : c.bindTexture(c.TEXTURE_2D, this.texture.baseTexture._glTextures[c.id]), c.bindBuffer(c.ELEMENT_ARRAY_BUFFER, this._indexBuffer), c.bufferData(c.ELEMENT_ARRAY_BUFFER, this.indices, c.STATIC_DRAW)) : (c.bindBuffer(c.ARRAY_BUFFER, this._vertexBuffer), c.bufferSubData(c.ARRAY_BUFFER, 0, this.vertices), c.vertexAttribPointer(f.aVertexPosition, 2, c.FLOAT, !1, 0, 0), c.bindBuffer(c.ARRAY_BUFFER, this._uvBuffer), c.vertexAttribPointer(f.aTextureCoord, 2, c.FLOAT, !1, 0, 0), c.activeTexture(c.TEXTURE0), this.texture.baseTexture._dirty[c.id] ? a.renderer.updateTexture(this.texture.baseTexture) : c.bindTexture(c.TEXTURE_2D, this.texture.baseTexture._glTextures[c.id]), c.bindBuffer(c.ELEMENT_ARRAY_BUFFER, this._indexBuffer)), c.drawElements(g, this.indices.length, c.UNSIGNED_SHORT, 0)
        },b.Strip.prototype._renderCanvas = function (a) {
            var c = a.context, d = this.worldTransform;
            a.roundPixels ? c.setTransform(d.a, d.b, d.c, d.d, 0 | d.tx, 0 | d.ty) : c.setTransform(d.a, d.b, d.c, d.d, d.tx, d.ty), this.drawMode === b.Strip.DrawModes.TRIANGLE_STRIP ? this._renderCanvasTriangleStrip(c) : this._renderCanvasTriangles(c)
        },b.Strip.prototype._renderCanvasTriangleStrip = function (a) {
            var b = this.vertices, c = this.uvs, d = b.length / 2;
            this.count++;
            for (var e = 0; d - 2 > e; e++) {
                var f = 2 * e;
                this._renderCanvasDrawTriangle(a, b, c, f, f + 2, f + 4)
            }
        },b.Strip.prototype._renderCanvasTriangles = function (a) {
            var b = this.vertices, c = this.uvs, d = this.indices, e = d.length;
            this.count++;
            for (var f = 0; e > f; f += 3) {
                var g = 2 * d[f], h = 2 * d[f + 1], i = 2 * d[f + 2];
                this._renderCanvasDrawTriangle(a, b, c, g, h, i)
            }
        },b.Strip.prototype._renderCanvasDrawTriangle = function (a, b, c, d, e, f) {
            var g = this.texture.baseTexture.source, h = this.texture.width, i = this.texture.height, j = b[d],
                    k = b[e], l = b[f], m = b[d + 1], n = b[e + 1], o = b[f + 1], p = c[d] * h, q = c[e] * h,
                    r = c[f] * h, s = c[d + 1] * i, t = c[e + 1] * i, u = c[f + 1] * i;
            if (this.canvasPadding > 0) {
                var v = this.canvasPadding / this.worldTransform.a, w = this.canvasPadding / this.worldTransform.d,
                        x = (j + k + l) / 3, y = (m + n + o) / 3, z = j - x, A = m - y, B = Math.sqrt(z * z + A * A);
                j = x + z / B * (B + v), m = y + A / B * (B + w), z = k - x, A = n - y, B = Math.sqrt(z * z + A * A), k = x + z / B * (B + v), n = y + A / B * (B + w), z = l - x, A = o - y, B = Math.sqrt(z * z + A * A), l = x + z / B * (B + v), o = y + A / B * (B + w)
            }
            a.save(), a.beginPath(), a.moveTo(j, m), a.lineTo(k, n), a.lineTo(l, o), a.closePath(), a.clip();
            var C = p * t + s * r + q * u - t * r - s * q - p * u, D = j * t + s * l + k * u - t * l - s * k - j * u,
                    E = p * k + j * r + q * l - k * r - j * q - p * l,
                    F = p * t * l + s * k * r + j * q * u - j * t * r - s * q * l - p * k * u,
                    G = m * t + s * o + n * u - t * o - s * n - m * u,
                    H = p * n + m * r + q * o - n * r - m * q - p * o,
                    I = p * t * o + s * n * r + m * q * u - m * t * r - s * q * o - p * n * u;
            a.transform(D / C, G / C, E / C, H / C, F / C, I / C), a.drawImage(g, 0, 0), a.restore()
        },b.Strip.prototype.renderStripFlat = function (a) {
            var b = this.context, c = a.vertices, d = c.length / 2;
            this.count++, b.beginPath();
            for (var e = 1; d - 2 > e; e++) {
                var f = 2 * e, g = c[f], h = c[f + 2], i = c[f + 4], j = c[f + 1], k = c[f + 3], l = c[f + 5];
                b.moveTo(g, j), b.lineTo(h, k), b.lineTo(i, l)
            }
            b.fillStyle = "#FF0000", b.fill(), b.closePath()
        },b.Strip.prototype.onTextureUpdate = function () {
            this.updateFrame = !0
        },b.Strip.prototype.getBounds = function (a) {
            for (var c = a || this.worldTransform, d = c.a, e = c.b, f = c.c, g = c.d, h = c.tx, i = c.ty, j = -1 / 0, k = -1 / 0, l = 1 / 0, m = 1 / 0, n = this.vertices, o = 0, p = n.length; p > o; o += 2) {
                var q = n[o], r = n[o + 1], s = d * q + f * r + h, t = g * r + e * q + i;
                l = l > s ? s : l, m = m > t ? t : m, j = s > j ? s : j, k = t > k ? t : k
            }
            if (l === -1 / 0 || 1 / 0 === k) return b.EmptyRectangle;
            var u = this._bounds;
            return u.x = l, u.width = j - l, u.y = m, u.height = k - m, this._currentBounds = u, u
        },b.Strip.DrawModes = {TRIANGLE_STRIP: 0, TRIANGLES: 1},b.Rope = function (a, c) {
            b.Strip.call(this, a), this.points = c, this.vertices = new b.Float32Array(4 * c.length), this.uvs = new b.Float32Array(4 * c.length), this.colors = new b.Float32Array(2 * c.length), this.indices = new b.Uint16Array(2 * c.length), this.refresh()
        },b.Rope.prototype = Object.create(b.Strip.prototype),b.Rope.prototype.constructor = b.Rope,b.Rope.prototype.refresh = function () {
            var a = this.points;
            if (!(a.length < 1)) {
                var b = this.uvs, c = a[0], d = this.indices, e = this.colors;
                this.count -= .2, b[0] = 0, b[1] = 0, b[2] = 0, b[3] = 1, e[0] = 1, e[1] = 1, d[0] = 0, d[1] = 1;
                for (var f, g, h, i = a.length, j = 1; i > j; j++) f = a[j], g = 4 * j, h = j / (i - 1), j % 2 ? (b[g] = h, b[g + 1] = 0, b[g + 2] = h, b[g + 3] = 1) : (b[g] = h, b[g + 1] = 0, b[g + 2] = h, b[g + 3] = 1), g = 2 * j, e[g] = 1, e[g + 1] = 1, g = 2 * j, d[g] = g, d[g + 1] = g + 1, c = f
            }
        },b.Rope.prototype.updateTransform = function () {
            var a = this.points;
            if (!(a.length < 1)) {
                var c, d = a[0], e = {x: 0, y: 0};
                this.count -= .2;
                for (var f, g, h, i, j, k = this.vertices, l = a.length, m = 0; l > m; m++) f = a[m], g = 4 * m, c = m < a.length - 1 ? a[m + 1] : f, e.y = -(c.x - d.x), e.x = c.y - d.y, h = 10 * (1 - m / (l - 1)), h > 1 && (h = 1), i = Math.sqrt(e.x * e.x + e.y * e.y), j = this.texture.height / 2, e.x /= i, e.y /= i, e.x *= j, e.y *= j, k[g] = f.x + e.x, k[g + 1] = f.y + e.y, k[g + 2] = f.x - e.x, k[g + 3] = f.y - e.y, d = f;
                b.DisplayObjectContainer.prototype.updateTransform.call(this)
            }
        },b.Rope.prototype.setTexture = function (a) {
            this.texture = a
        },b.TilingSprite = function (a, c, d) {
            b.Sprite.call(this, a), this._width = c || 100, this._height = d || 100, this.tileScale = new b.Point(1, 1), this.tileScaleOffset = new b.Point(1, 1), this.tilePosition = new b.Point(0, 0), this.renderable = !0, this.tint = 16777215, this.blendMode = b.blendModes.NORMAL
        },b.TilingSprite.prototype = Object.create(b.Sprite.prototype),b.TilingSprite.prototype.constructor = b.TilingSprite,Object.defineProperty(b.TilingSprite.prototype, "width", {
            get: function () {
                return this._width
            }, set: function (a) {
                this._width = a
            }
        }),Object.defineProperty(b.TilingSprite.prototype, "height", {
            get: function () {
                return this._height
            }, set: function (a) {
                this._height = a
            }
        }),b.TilingSprite.prototype.setTexture = function (a) {
            this.texture !== a && (this.texture = a, this.refreshTexture = !0, this.cachedTint = 16777215)
        },b.TilingSprite.prototype._renderWebGL = function (a) {
            if (this.visible !== !1 && 0 !== this.alpha) {
                var b, c;
                for (this._mask && (a.spriteBatch.stop(), a.maskManager.pushMask(this.mask, a), a.spriteBatch.start()), this._filters && (a.spriteBatch.flush(), a.filterManager.pushFilter(this._filterBlock)), !this.tilingTexture || this.refreshTexture ? (this.generateTilingTexture(!0), this.tilingTexture && this.tilingTexture.needsUpdate && (a.renderer.updateTexture(this.tilingTexture.baseTexture), this.tilingTexture.needsUpdate = !1)) : a.spriteBatch.renderTilingSprite(this), b = 0, c = this.children.length; c > b; b++) this.children[b]._renderWebGL(a);
                a.spriteBatch.stop(), this._filters && a.filterManager.popFilter(), this._mask && a.maskManager.popMask(this._mask, a), a.spriteBatch.start()
            }
        },b.TilingSprite.prototype._renderCanvas = function (a) {
            if (this.visible !== !1 && 0 !== this.alpha) {
                var c = a.context;
                this._mask && a.maskManager.pushMask(this._mask, c), c.globalAlpha = this.worldAlpha;
                var d, e, f = this.worldTransform, g = a.resolution;
                if (c.setTransform(f.a * g, f.b * g, f.c * g, f.d * g, f.tx * g, f.ty * g), !this.__tilePattern || this.refreshTexture) {
                    if (this.generateTilingTexture(!1), !this.tilingTexture) return;
                    this.__tilePattern = c.createPattern(this.tilingTexture.baseTexture.source, "repeat")
                }
                this.blendMode !== a.currentBlendMode && (a.currentBlendMode = this.blendMode, c.globalCompositeOperation = b.blendModesCanvas[a.currentBlendMode]);
                var h = this.tilePosition, i = this.tileScale;
                for (h.x %= this.tilingTexture.baseTexture.width, h.y %= this.tilingTexture.baseTexture.height, c.scale(i.x, i.y), c.translate(h.x + this.anchor.x * -this._width, h.y + this.anchor.y * -this._height), c.fillStyle = this.__tilePattern, c.fillRect(-h.x, -h.y, this._width / i.x, this._height / i.y), c.scale(1 / i.x, 1 / i.y), c.translate(-h.x + this.anchor.x * this._width, -h.y + this.anchor.y * this._height), this._mask && a.maskManager.popMask(a.context), d = 0, e = this.children.length; e > d; d++) this.children[d]._renderCanvas(a)
            }
        },b.TilingSprite.prototype.getBounds = function () {
            var a = this._width, b = this._height, c = a * (1 - this.anchor.x), d = a * -this.anchor.x,
                    e = b * (1 - this.anchor.y), f = b * -this.anchor.y, g = this.worldTransform, h = g.a, i = g.b,
                    j = g.c, k = g.d, l = g.tx, m = g.ty, n = h * d + j * f + l, o = k * f + i * d + m,
                    p = h * c + j * f + l, q = k * f + i * c + m, r = h * c + j * e + l, s = k * e + i * c + m,
                    t = h * d + j * e + l, u = k * e + i * d + m, v = -1 / 0, w = -1 / 0, x = 1 / 0, y = 1 / 0;
            x = x > n ? n : x, x = x > p ? p : x, x = x > r ? r : x, x = x > t ? t : x, y = y > o ? o : y, y = y > q ? q : y, y = y > s ? s : y, y = y > u ? u : y, v = n > v ? n : v, v = p > v ? p : v, v = r > v ? r : v, v = t > v ? t : v, w = o > w ? o : w, w = q > w ? q : w, w = s > w ? s : w, w = u > w ? u : w;
            var z = this._bounds;
            return z.x = x, z.width = v - x, z.y = y, z.height = w - y, this._currentBounds = z, z
        },b.TilingSprite.prototype.onTextureUpdate = function () {
        },b.TilingSprite.prototype.generateTilingTexture = function (a) {
            if (this.texture.baseTexture.hasLoaded) {
                var c, d, e = this.originalTexture || this.texture, f = e.frame,
                        g = f.width !== e.baseTexture.width || f.height !== e.baseTexture.height, h = !1;
                if (a ? (c = b.getNextPowerOfTwo(f.width), d = b.getNextPowerOfTwo(f.height), (f.width !== c || f.height !== d || e.baseTexture.width !== c || e.baseTexture.height || d) && (h = !0)) : g && (c = f.width, d = f.height, h = !0), h) {
                    var i;
                    this.tilingTexture && this.tilingTexture.isTiling ? (i = this.tilingTexture.canvasBuffer, i.resize(c, d), this.tilingTexture.baseTexture.width = c, this.tilingTexture.baseTexture.height = d, this.tilingTexture.needsUpdate = !0) : (i = new b.CanvasBuffer(c, d), this.tilingTexture = b.Texture.fromCanvas(i.canvas), this.tilingTexture.canvasBuffer = i, this.tilingTexture.isTiling = !0), i.context.drawImage(e.baseTexture.source, e.crop.x, e.crop.y, e.crop.width, e.crop.height, 0, 0, c, d), this.tileScaleOffset.x = f.width / c, this.tileScaleOffset.y = f.height / d
                } else this.tilingTexture && this.tilingTexture.isTiling && this.tilingTexture.destroy(!0), this.tileScaleOffset.x = 1, this.tileScaleOffset.y = 1, this.tilingTexture = e;
                this.refreshTexture = !1, this.originalTexture = this.texture, this.texture = this.tilingTexture, this.tilingTexture.baseTexture._powerOf2 = !0
            }
        },b.TilingSprite.prototype.destroy = function () {
            b.Sprite.prototype.destroy.call(this), this.tileScale = null, this.tileScaleOffset = null, this.tilePosition = null, this.tilingTexture.destroy(!0), this.tilingTexture = null
        };
        var c = {
            radDeg: 180 / Math.PI,
            degRad: Math.PI / 180,
            temp: [],
            Float32Array: "undefined" == typeof Float32Array ? Array : Float32Array,
            Uint16Array: "undefined" == typeof Uint16Array ? Array : Uint16Array
        };
        c.BoneData = function (a, b) {
            this.name = a, this.parent = b
        }, c.BoneData.prototype = {
            length: 0,
            x: 0,
            y: 0,
            rotation: 0,
            scaleX: 1,
            scaleY: 1,
            inheritScale: !0,
            inheritRotation: !0,
            flipX: !1,
            flipY: !1
        }, c.SlotData = function (a, b) {
            this.name = a, this.boneData = b
        }, c.SlotData.prototype = {
            r: 1,
            g: 1,
            b: 1,
            a: 1,
            attachmentName: null,
            additiveBlending: !1
        }, c.IkConstraintData = function (a) {
            this.name = a, this.bones = []
        }, c.IkConstraintData.prototype = {target: null, bendDirection: 1, mix: 1}, c.Bone = function (a, b, c) {
            this.data = a, this.skeleton = b, this.parent = c, this.setToSetupPose()
        }, c.Bone.yDown = !1, c.Bone.prototype = {
            x: 0,
            y: 0,
            rotation: 0,
            rotationIK: 0,
            scaleX: 1,
            scaleY: 1,
            flipX: !1,
            flipY: !1,
            m00: 0,
            m01: 0,
            worldX: 0,
            m10: 0,
            m11: 0,
            worldY: 0,
            worldRotation: 0,
            worldScaleX: 1,
            worldScaleY: 1,
            worldFlipX: !1,
            worldFlipY: !1,
            updateWorldTransform: function () {
                var a = this.parent;
                if (a) this.worldX = this.x * a.m00 + this.y * a.m01 + a.worldX, this.worldY = this.x * a.m10 + this.y * a.m11 + a.worldY, this.data.inheritScale ? (this.worldScaleX = a.worldScaleX * this.scaleX, this.worldScaleY = a.worldScaleY * this.scaleY) : (this.worldScaleX = this.scaleX, this.worldScaleY = this.scaleY), this.worldRotation = this.data.inheritRotation ? a.worldRotation + this.rotationIK : this.rotationIK, this.worldFlipX = a.worldFlipX != this.flipX, this.worldFlipY = a.worldFlipY != this.flipY; else {
                    var b = this.skeleton.flipX, d = this.skeleton.flipY;
                    this.worldX = b ? -this.x : this.x, this.worldY = d != c.Bone.yDown ? -this.y : this.y, this.worldScaleX = this.scaleX, this.worldScaleY = this.scaleY, this.worldRotation = this.rotationIK, this.worldFlipX = b != this.flipX, this.worldFlipY = d != this.flipY
                }
                var e = this.worldRotation * c.degRad, f = Math.cos(e), g = Math.sin(e);
                this.worldFlipX ? (this.m00 = -f * this.worldScaleX, this.m01 = g * this.worldScaleY) : (this.m00 = f * this.worldScaleX, this.m01 = -g * this.worldScaleY), this.worldFlipY != c.Bone.yDown ? (this.m10 = -g * this.worldScaleX, this.m11 = -f * this.worldScaleY) : (this.m10 = g * this.worldScaleX, this.m11 = f * this.worldScaleY)
            },
            setToSetupPose: function () {
                var a = this.data;
                this.x = a.x, this.y = a.y, this.rotation = a.rotation, this.rotationIK = this.rotation, this.scaleX = a.scaleX, this.scaleY = a.scaleY, this.flipX = a.flipX, this.flipY = a.flipY
            },
            worldToLocal: function (a) {
                var b = a[0] - this.worldX, d = a[1] - this.worldY, e = this.m00, f = this.m10, g = this.m01,
                        h = this.m11;
                this.worldFlipX != (this.worldFlipY != c.Bone.yDown) && (e = -e, h = -h);
                var i = 1 / (e * h - g * f);
                a[0] = b * e * i - d * g * i, a[1] = d * h * i - b * f * i
            },
            localToWorld: function (a) {
                var b = a[0], c = a[1];
                a[0] = b * this.m00 + c * this.m01 + this.worldX, a[1] = b * this.m10 + c * this.m11 + this.worldY
            }
        }, c.Slot = function (a, b) {
            this.data = a, this.bone = b, this.setToSetupPose()
        }, c.Slot.prototype = {
            r: 1,
            g: 1,
            b: 1,
            a: 1,
            _attachmentTime: 0,
            attachment: null,
            attachmentVertices: [],
            setAttachment: function (a) {
                this.attachment = a, this._attachmentTime = this.bone.skeleton.time, this.attachmentVertices.length = 0
            },
            setAttachmentTime: function (a) {
                this._attachmentTime = this.bone.skeleton.time - a
            },
            getAttachmentTime: function () {
                return this.bone.skeleton.time - this._attachmentTime
            },
            setToSetupPose: function () {
                var a = this.data;
                this.r = a.r, this.g = a.g, this.b = a.b, this.a = a.a;
                for (var b = this.bone.skeleton.data.slots, c = 0, d = b.length; d > c; c++) if (b[c] == a) {
                    this.setAttachment(a.attachmentName ? this.bone.skeleton.getAttachmentBySlotIndex(c, a.attachmentName) : null);
                    break
                }
            }
        }, c.IkConstraint = function (a, b) {
            this.data = a, this.mix = a.mix, this.bendDirection = a.bendDirection, this.bones = [];
            for (var c = 0, d = a.bones.length; d > c; c++) this.bones.push(b.findBone(a.bones[c].name));
            this.target = b.findBone(a.target.name)
        }, c.IkConstraint.prototype = {
            apply: function () {
                var a = this.target, b = this.bones;
                switch (b.length) {
                    case 1:
                        c.IkConstraint.apply1(b[0], a.worldX, a.worldY, this.mix);
                        break;
                    case 2:
                        c.IkConstraint.apply2(b[0], b[1], a.worldX, a.worldY, this.bendDirection, this.mix)
                }
            }
        }, c.IkConstraint.apply1 = function (a, b, d, e) {
            var f = a.data.inheritRotation && a.parent ? a.parent.worldRotation : 0, g = a.rotation,
                    h = Math.atan2(d - a.worldY, b - a.worldX) * c.radDeg - f;
            a.rotationIK = g + (h - g) * e
        }, c.IkConstraint.apply2 = function (a, b, d, e, f, g) {
            var h = b.rotation, i = a.rotation;
            if (!g) return b.rotationIK = h, void(a.rotationIK = i);
            var j, k, l = c.temp, m = a.parent;
            m ? (l[0] = d, l[1] = e, m.worldToLocal(l), d = (l[0] - a.x) * m.worldScaleX, e = (l[1] - a.y) * m.worldScaleY) : (d -= a.x, e -= a.y), b.parent == a ? (j = b.x, k = b.y) : (l[0] = b.x, l[1] = b.y, b.parent.localToWorld(l), a.worldToLocal(l), j = l[0], k = l[1]);
            var n = j * a.worldScaleX, o = k * a.worldScaleY, p = Math.atan2(o, n), q = Math.sqrt(n * n + o * o),
                    r = b.data.length * b.worldScaleX, s = 2 * q * r;
            if (1e-4 > s) return void(b.rotationIK = h + (Math.atan2(e, d) * c.radDeg - i - h) * g);
            var t = (d * d + e * e - q * q - r * r) / s;
            -1 > t ? t = -1 : t > 1 && (t = 1);
            var u = Math.acos(t) * f, v = q + r * t, w = r * Math.sin(u), x = Math.atan2(e * v - d * w, d * v + e * w),
                    y = (x - p) * c.radDeg - i;
            y > 180 ? y -= 360 : -180 > y && (y += 360), a.rotationIK = i + y * g, y = (u + p) * c.radDeg - h, y > 180 ? y -= 360 : -180 > y && (y += 360), b.rotationIK = h + (y + a.worldRotation - b.parent.worldRotation) * g
        }, c.Skin = function (a) {
            this.name = a, this.attachments = {}
        }, c.Skin.prototype = {
            addAttachment: function (a, b, c) {
                this.attachments[a + ":" + b] = c
            }, getAttachment: function (a, b) {
                return this.attachments[a + ":" + b]
            }, _attachAll: function (a, b) {
                for (var c in b.attachments) {
                    var d = c.indexOf(":"), e = parseInt(c.substring(0, d)), f = c.substring(d + 1), g = a.slots[e];
                    if (g.attachment && g.attachment.name == f) {
                        var h = this.getAttachment(e, f);
                        h && g.setAttachment(h)
                    }
                }
            }
        }, c.Animation = function (a, b, c) {
            this.name = a, this.timelines = b, this.duration = c
        }, c.Animation.prototype = {
            apply: function (a, b, c, d, e) {
                d && 0 != this.duration && (c %= this.duration, b %= this.duration);
                for (var f = this.timelines, g = 0, h = f.length; h > g; g++) f[g].apply(a, b, c, e, 1)
            }, mix: function (a, b, c, d, e, f) {
                d && 0 != this.duration && (c %= this.duration, b %= this.duration);
                for (var g = this.timelines, h = 0, i = g.length; i > h; h++) g[h].apply(a, b, c, e, f)
            }
        }, c.Animation.binarySearch = function (a, b, c) {
            var d = 0, e = Math.floor(a.length / c) - 2;
            if (!e) return c;
            for (var f = e >>> 1; ;) {
                if (a[(f + 1) * c] <= b ? d = f + 1 : e = f, d == e) return (d + 1) * c;
                f = d + e >>> 1
            }
        }, c.Animation.binarySearch1 = function (a, b) {
            var c = 0, d = a.length - 2;
            if (!d) return 1;
            for (var e = d >>> 1; ;) {
                if (a[e + 1] <= b ? c = e + 1 : d = e, c == d) return c + 1;
                e = c + d >>> 1
            }
        }, c.Animation.linearSearch = function (a, b, c) {
            for (var d = 0, e = a.length - c; e >= d; d += c) if (a[d] > b) return d;
            return -1
        }, c.Curves = function () {
            this.curves = []
        }, c.Curves.prototype = {
            setLinear: function (a) {
                this.curves[19 * a] = 0
            }, setStepped: function (a) {
                this.curves[19 * a] = 1
            }, setCurve: function (a, b, c, d, e) {
                var f = .1, g = f * f, h = g * f, i = 3 * f, j = 3 * g, k = 6 * g, l = 6 * h, m = 2 * -b + d,
                        n = 2 * -c + e, o = 3 * (b - d) + 1, p = 3 * (c - e) + 1, q = b * i + m * j + o * h,
                        r = c * i + n * j + p * h, s = m * k + o * l, t = n * k + p * l, u = o * l, v = p * l,
                        w = 19 * a, x = this.curves;
                x[w++] = 2;
                for (var y = q, z = r, A = w + 19 - 1; A > w; w += 2) x[w] = y, x[w + 1] = z, q += s, r += t, s += u, t += v, y += q, z += r
            }, getCurvePercent: function (a, b) {
                b = 0 > b ? 0 : b > 1 ? 1 : b;
                var c = this.curves, d = 19 * a, e = c[d];
                if (0 === e) return b;
                if (1 == e) return 0;
                d++;
                for (var f = 0, g = d, h = d + 19 - 1; h > d; d += 2) if (f = c[d], f >= b) {
                    var i, j;
                    return d == g ? (i = 0, j = 0) : (i = c[d - 2], j = c[d - 1]), j + (c[d + 1] - j) * (b - i) / (f - i)
                }
                var k = c[d - 1];
                return k + (1 - k) * (b - f) / (1 - f)
            }
        }, c.RotateTimeline = function (a) {
            this.curves = new c.Curves(a), this.frames = [], this.frames.length = 2 * a
        }, c.RotateTimeline.prototype = {
            boneIndex: 0, getFrameCount: function () {
                return this.frames.length / 2
            }, setFrame: function (a, b, c) {
                a *= 2, this.frames[a] = b, this.frames[a + 1] = c
            }, apply: function (a, b, d, e, f) {
                var g = this.frames;
                if (!(d < g[0])) {
                    var h = a.bones[this.boneIndex];
                    if (d >= g[g.length - 2]) {
                        for (var i = h.data.rotation + g[g.length - 1] - h.rotation; i > 180;) i -= 360;
                        for (; -180 > i;) i += 360;
                        return void(h.rotation += i * f)
                    }
                    var j = c.Animation.binarySearch(g, d, 2), k = g[j - 1], l = g[j], m = 1 - (d - l) / (g[j - 2] - l);
                    m = this.curves.getCurvePercent(j / 2 - 1, m);
                    for (var i = g[j + 1] - k; i > 180;) i -= 360;
                    for (; -180 > i;) i += 360;
                    for (i = h.data.rotation + (k + i * m) - h.rotation; i > 180;) i -= 360;
                    for (; -180 > i;) i += 360;
                    h.rotation += i * f
                }
            }
        }, c.TranslateTimeline = function (a) {
            this.curves = new c.Curves(a), this.frames = [], this.frames.length = 3 * a
        }, c.TranslateTimeline.prototype = {
            boneIndex: 0, getFrameCount: function () {
                return this.frames.length / 3
            }, setFrame: function (a, b, c, d) {
                a *= 3, this.frames[a] = b, this.frames[a + 1] = c, this.frames[a + 2] = d
            }, apply: function (a, b, d, e, f) {
                var g = this.frames;
                if (!(d < g[0])) {
                    var h = a.bones[this.boneIndex];
                    if (d >= g[g.length - 3]) return h.x += (h.data.x + g[g.length - 2] - h.x) * f, void(h.y += (h.data.y + g[g.length - 1] - h.y) * f);
                    var i = c.Animation.binarySearch(g, d, 3), j = g[i - 2], k = g[i - 1], l = g[i],
                            m = 1 - (d - l) / (g[i + -3] - l);
                    m = this.curves.getCurvePercent(i / 3 - 1, m), h.x += (h.data.x + j + (g[i + 1] - j) * m - h.x) * f, h.y += (h.data.y + k + (g[i + 2] - k) * m - h.y) * f
                }
            }
        }, c.ScaleTimeline = function (a) {
            this.curves = new c.Curves(a), this.frames = [], this.frames.length = 3 * a
        }, c.ScaleTimeline.prototype = {
            boneIndex: 0, getFrameCount: function () {
                return this.frames.length / 3
            }, setFrame: function (a, b, c, d) {
                a *= 3, this.frames[a] = b, this.frames[a + 1] = c, this.frames[a + 2] = d
            }, apply: function (a, b, d, e, f) {
                var g = this.frames;
                if (!(d < g[0])) {
                    var h = a.bones[this.boneIndex];
                    if (d >= g[g.length - 3]) return h.scaleX += (h.data.scaleX * g[g.length - 2] - h.scaleX) * f, void(h.scaleY += (h.data.scaleY * g[g.length - 1] - h.scaleY) * f);
                    var i = c.Animation.binarySearch(g, d, 3), j = g[i - 2], k = g[i - 1], l = g[i],
                            m = 1 - (d - l) / (g[i + -3] - l);
                    m = this.curves.getCurvePercent(i / 3 - 1, m), h.scaleX += (h.data.scaleX * (j + (g[i + 1] - j) * m) - h.scaleX) * f, h.scaleY += (h.data.scaleY * (k + (g[i + 2] - k) * m) - h.scaleY) * f
                }
            }
        }, c.ColorTimeline = function (a) {
            this.curves = new c.Curves(a), this.frames = [], this.frames.length = 5 * a
        }, c.ColorTimeline.prototype = {
            slotIndex: 0, getFrameCount: function () {
                return this.frames.length / 5
            }, setFrame: function (a, b, c, d, e, f) {
                a *= 5, this.frames[a] = b, this.frames[a + 1] = c, this.frames[a + 2] = d, this.frames[a + 3] = e, this.frames[a + 4] = f
            }, apply: function (a, b, d, e, f) {
                var g = this.frames;
                if (!(d < g[0])) {
                    var h, i, j, k;
                    if (d >= g[g.length - 5]) {
                        var l = g.length - 1;
                        h = g[l - 3], i = g[l - 2], j = g[l - 1], k = g[l]
                    } else {
                        var m = c.Animation.binarySearch(g, d, 5), n = g[m - 4], o = g[m - 3], p = g[m - 2],
                                q = g[m - 1], r = g[m], s = 1 - (d - r) / (g[m - 5] - r);
                        s = this.curves.getCurvePercent(m / 5 - 1, s), h = n + (g[m + 1] - n) * s, i = o + (g[m + 2] - o) * s, j = p + (g[m + 3] - p) * s, k = q + (g[m + 4] - q) * s
                    }
                    var t = a.slots[this.slotIndex];
                    1 > f ? (t.r += (h - t.r) * f, t.g += (i - t.g) * f, t.b += (j - t.b) * f, t.a += (k - t.a) * f) : (t.r = h, t.g = i, t.b = j, t.a = k)
                }
            }
        }, c.AttachmentTimeline = function (a) {
            this.curves = new c.Curves(a), this.frames = [], this.frames.length = a, this.attachmentNames = [], this.attachmentNames.length = a
        }, c.AttachmentTimeline.prototype = {
            slotIndex: 0, getFrameCount: function () {
                return this.frames.length
            }, setFrame: function (a, b, c) {
                this.frames[a] = b, this.attachmentNames[a] = c
            }, apply: function (a, b, d) {
                var e = this.frames;
                if (d < e[0]) return void(b > d && this.apply(a, b, Number.MAX_VALUE, null, 0));
                b > d && (b = -1);
                var f = d >= e[e.length - 1] ? e.length - 1 : c.Animation.binarySearch1(e, d) - 1;
                if (!(e[f] < b)) {
                    var g = this.attachmentNames[f];
                    a.slots[this.slotIndex].setAttachment(g ? a.getAttachmentBySlotIndex(this.slotIndex, g) : null)
                }
            }
        }, c.EventTimeline = function (a) {
            this.frames = [], this.frames.length = a, this.events = [], this.events.length = a
        }, c.EventTimeline.prototype = {
            getFrameCount: function () {
                return this.frames.length
            }, setFrame: function (a, b, c) {
                this.frames[a] = b, this.events[a] = c
            }, apply: function (a, b, d, e, f) {
                if (e) {
                    var g = this.frames, h = g.length;
                    if (b > d) this.apply(a, b, Number.MAX_VALUE, e, f), b = -1; else if (b >= g[h - 1]) return;
                    if (!(d < g[0])) {
                        var i;
                        if (b < g[0]) i = 0; else {
                            i = c.Animation.binarySearch1(g, b);
                            for (var j = g[i]; i > 0 && g[i - 1] == j;) i--
                        }
                        for (var k = this.events; h > i && d >= g[i]; i++) e.push(k[i])
                    }
                }
            }
        }, c.DrawOrderTimeline = function (a) {
            this.frames = [], this.frames.length = a, this.drawOrders = [], this.drawOrders.length = a
        }, c.DrawOrderTimeline.prototype = {
            getFrameCount: function () {
                return this.frames.length
            }, setFrame: function (a, b, c) {
                this.frames[a] = b, this.drawOrders[a] = c
            }, apply: function (a, b, d) {
                var e = this.frames;
                if (!(d < e[0])) {
                    var f;
                    f = d >= e[e.length - 1] ? e.length - 1 : c.Animation.binarySearch1(e, d) - 1;
                    var g = a.drawOrder, h = a.slots, i = this.drawOrders[f];
                    if (i) for (var j = 0, k = i.length; k > j; j++) g[j] = a.slots[i[j]]; else for (var j = 0, k = h.length; k > j; j++) g[j] = h[j]
                }
            }
        }, c.FfdTimeline = function (a) {
            this.curves = new c.Curves(a), this.frames = [], this.frames.length = a, this.frameVertices = [], this.frameVertices.length = a
        }, c.FfdTimeline.prototype = {
            slotIndex: 0, attachment: 0, getFrameCount: function () {
                return this.frames.length
            }, setFrame: function (a, b, c) {
                this.frames[a] = b, this.frameVertices[a] = c
            }, apply: function (a, b, d, e, f) {
                var g = a.slots[this.slotIndex];
                if (g.attachment == this.attachment) {
                    var h = this.frames;
                    if (!(d < h[0])) {
                        var i = this.frameVertices, j = i[0].length, k = g.attachmentVertices;
                        if (k.length != j && (f = 1), k.length = j, d >= h[h.length - 1]) {
                            var l = i[h.length - 1];
                            if (1 > f) for (var m = 0; j > m; m++) k[m] += (l[m] - k[m]) * f; else for (var m = 0; j > m; m++) k[m] = l[m]
                        } else {
                            var n = c.Animation.binarySearch1(h, d), o = h[n], p = 1 - (d - o) / (h[n - 1] - o);
                            p = this.curves.getCurvePercent(n - 1, 0 > p ? 0 : p > 1 ? 1 : p);
                            var q = i[n - 1], r = i[n];
                            if (1 > f) for (var m = 0; j > m; m++) {
                                var s = q[m];
                                k[m] += (s + (r[m] - s) * p - k[m]) * f
                            } else for (var m = 0; j > m; m++) {
                                var s = q[m];
                                k[m] = s + (r[m] - s) * p
                            }
                        }
                    }
                }
            }
        }, c.IkConstraintTimeline = function (a) {
            this.curves = new c.Curves(a), this.frames = [], this.frames.length = 3 * a
        }, c.IkConstraintTimeline.prototype = {
            ikConstraintIndex: 0, getFrameCount: function () {
                return this.frames.length / 3
            }, setFrame: function (a, b, c, d) {
                a *= 3, this.frames[a] = b, this.frames[a + 1] = c, this.frames[a + 2] = d
            }, apply: function (a, b, d, e, f) {
                var g = this.frames;
                if (!(d < g[0])) {
                    var h = a.ikConstraints[this.ikConstraintIndex];
                    if (d >= g[g.length - 3]) return h.mix += (g[g.length - 2] - h.mix) * f, void(h.bendDirection = g[g.length - 1]);
                    var i = c.Animation.binarySearch(g, d, 3), j = g[i + -2], k = g[i],
                            l = 1 - (d - k) / (g[i + -3] - k);
                    l = this.curves.getCurvePercent(i / 3 - 1, l);
                    var m = j + (g[i + 1] - j) * l;
                    h.mix += (m - h.mix) * f, h.bendDirection = g[i + -1]
                }
            }
        }, c.FlipXTimeline = function (a) {
            this.curves = new c.Curves(a), this.frames = [], this.frames.length = 2 * a
        }, c.FlipXTimeline.prototype = {
            boneIndex: 0, getFrameCount: function () {
                return this.frames.length / 2
            }, setFrame: function (a, b, c) {
                a *= 2, this.frames[a] = b, this.frames[a + 1] = c ? 1 : 0
            }, apply: function (a, b, d) {
                var e = this.frames;
                if (d < e[0]) return void(b > d && this.apply(a, b, Number.MAX_VALUE, null, 0));
                b > d && (b = -1);
                var f = (d >= e[e.length - 2] ? e.length : c.Animation.binarySearch(e, d, 2)) - 2;
                e[f] < b || (a.bones[boneIndex].flipX = 0 != e[f + 1])
            }
        }, c.FlipYTimeline = function (a) {
            this.curves = new c.Curves(a), this.frames = [], this.frames.length = 2 * a
        }, c.FlipYTimeline.prototype = {
            boneIndex: 0, getFrameCount: function () {
                return this.frames.length / 2
            }, setFrame: function (a, b, c) {
                a *= 2, this.frames[a] = b, this.frames[a + 1] = c ? 1 : 0
            }, apply: function (a, b, d) {
                var e = this.frames;
                if (d < e[0]) return void(b > d && this.apply(a, b, Number.MAX_VALUE, null, 0));
                b > d && (b = -1);
                var f = (d >= e[e.length - 2] ? e.length : c.Animation.binarySearch(e, d, 2)) - 2;
                e[f] < b || (a.bones[boneIndex].flipY = 0 != e[f + 1])
            }
        }, c.SkeletonData = function () {
            this.bones = [], this.slots = [], this.skins = [], this.events = [], this.animations = [], this.ikConstraints = []
        }, c.SkeletonData.prototype = {
            name: null,
            defaultSkin: null,
            width: 0,
            height: 0,
            version: null,
            hash: null,
            findBone: function (a) {
                for (var b = this.bones, c = 0, d = b.length; d > c; c++) if (b[c].name == a) return b[c];
                return null
            },
            findBoneIndex: function (a) {
                for (var b = this.bones, c = 0, d = b.length; d > c; c++) if (b[c].name == a) return c;
                return -1
            },
            findSlot: function (a) {
                for (var b = this.slots, c = 0, d = b.length; d > c; c++) if (b[c].name == a) return slot[c];
                return null
            },
            findSlotIndex: function (a) {
                for (var b = this.slots, c = 0, d = b.length; d > c; c++) if (b[c].name == a) return c;
                return -1
            },
            findSkin: function (a) {
                for (var b = this.skins, c = 0, d = b.length; d > c; c++) if (b[c].name == a) return b[c];
                return null
            },
            findEvent: function (a) {
                for (var b = this.events, c = 0, d = b.length; d > c; c++) if (b[c].name == a) return b[c];
                return null
            },
            findAnimation: function (a) {
                for (var b = this.animations, c = 0, d = b.length; d > c; c++) if (b[c].name == a) return b[c];
                return null
            },
            findIkConstraint: function (a) {
                for (var b = this.ikConstraints, c = 0, d = b.length; d > c; c++) if (b[c].name == a) return b[c];
                return null
            }
        }, c.Skeleton = function (a) {
            this.data = a, this.bones = [];
            for (var b = 0, d = a.bones.length; d > b; b++) {
                var e = a.bones[b], f = e.parent ? this.bones[a.bones.indexOf(e.parent)] : null;
                this.bones.push(new c.Bone(e, this, f))
            }
            this.slots = [], this.drawOrder = [];
            for (var b = 0, d = a.slots.length; d > b; b++) {
                var g = a.slots[b], h = this.bones[a.bones.indexOf(g.boneData)], i = new c.Slot(g, h);
                this.slots.push(i), this.drawOrder.push(i)
            }
            this.ikConstraints = [];
            for (var b = 0, d = a.ikConstraints.length; d > b; b++) this.ikConstraints.push(new c.IkConstraint(a.ikConstraints[b], this));
            this.boneCache = [], this.updateCache()
        }, c.Skeleton.prototype = {
            x: 0,
            y: 0,
            skin: null,
            r: 1,
            g: 1,
            b: 1,
            a: 1,
            time: 0,
            flipX: !1,
            flipY: !1,
            updateCache: function () {
                var a = this.ikConstraints, b = a.length, c = b + 1, d = this.boneCache;
                d.length > c && (d.length = c);
                for (var e = 0, f = d.length; f > e; e++) d[e].length = 0;
                for (; d.length < c;) d[d.length] = [];
                var g = d[0], h = this.bones;
                a:for (var e = 0, f = h.length; f > e; e++) {
                    var i = h[e], j = i;
                    do {
                        for (var k = 0; b > k; k++) for (var l = a[k], m = l.bones[0], n = l.bones[l.bones.length - 1]; ;) {
                            if (j == n) {
                                d[k].push(i), d[k + 1].push(i);
                                continue a
                            }
                            if (n == m) break;
                            n = n.parent
                        }
                        j = j.parent
                    } while (j);
                    g[g.length] = i
                }
            },
            updateWorldTransform: function () {
                for (var a = this.bones, b = 0, c = a.length; c > b; b++) {
                    var d = a[b];
                    d.rotationIK = d.rotation
                }
                for (var b = 0, e = this.boneCache.length - 1; ;) {
                    for (var f = this.boneCache[b], g = 0, h = f.length; h > g; g++) f[g].updateWorldTransform();
                    if (b == e) break;
                    this.ikConstraints[b].apply(), b++
                }
            },
            setToSetupPose: function () {
                this.setBonesToSetupPose(), this.setSlotsToSetupPose()
            },
            setBonesToSetupPose: function () {
                for (var a = this.bones, b = 0, c = a.length; c > b; b++) a[b].setToSetupPose();
                for (var d = this.ikConstraints, b = 0, c = d.length; c > b; b++) {
                    var e = d[b];
                    e.bendDirection = e.data.bendDirection, e.mix = e.data.mix
                }
            },
            setSlotsToSetupPose: function () {
                for (var a = this.slots, b = this.drawOrder, c = 0, d = a.length; d > c; c++) b[c] = a[c], a[c].setToSetupPose(c)
            },
            getRootBone: function () {
                return this.bones.length ? this.bones[0] : null
            },
            findBone: function (a) {
                for (var b = this.bones, c = 0, d = b.length; d > c; c++) if (b[c].data.name == a) return b[c];
                return null
            },
            findBoneIndex: function (a) {
                for (var b = this.bones, c = 0, d = b.length; d > c; c++) if (b[c].data.name == a) return c;
                return -1
            },
            findSlot: function (a) {
                for (var b = this.slots, c = 0, d = b.length; d > c; c++) if (b[c].data.name == a) return b[c];
                return null
            },
            findSlotIndex: function (a) {
                for (var b = this.slots, c = 0, d = b.length; d > c; c++) if (b[c].data.name == a) return c;
                return -1
            },
            setSkinByName: function (a) {
                var b = this.data.findSkin(a);
                if (!b) throw"Skin not found: " + a;
                this.setSkin(b)
            },
            setSkin: function (a) {
                if (a) if (this.skin) a._attachAll(this, this.skin); else for (var b = this.slots, c = 0, d = b.length; d > c; c++) {
                    var e = b[c], f = e.data.attachmentName;
                    if (f) {
                        var g = a.getAttachment(c, f);
                        g && e.setAttachment(g)
                    }
                }
                this.skin = a
            },
            getAttachmentBySlotName: function (a, b) {
                return this.getAttachmentBySlotIndex(this.data.findSlotIndex(a), b)
            },
            getAttachmentBySlotIndex: function (a, b) {
                if (this.skin) {
                    var c = this.skin.getAttachment(a, b);
                    if (c) return c
                }
                return this.data.defaultSkin ? this.data.defaultSkin.getAttachment(a, b) : null
            },
            setAttachment: function (a, b) {
                for (var c = this.slots, d = 0, e = c.length; e > d; d++) {
                    var f = c[d];
                    if (f.data.name == a) {
                        var g = null;
                        if (b && (g = this.getAttachmentBySlotIndex(d, b), !g)) throw"Attachment not found: " + b + ", for slot: " + a;
                        return void f.setAttachment(g)
                    }
                }
                throw"Slot not found: " + a
            },
            findIkConstraint: function (a) {
                for (var b = this.ikConstraints, c = 0, d = b.length; d > c; c++) if (b[c].data.name == a) return b[c];
                return null
            },
            update: function (a) {
                this.time += a
            }
        }, c.EventData = function (a) {
            this.name = a
        }, c.EventData.prototype = {intValue: 0, floatValue: 0, stringValue: null}, c.Event = function (a) {
            this.data = a
        }, c.Event.prototype = {intValue: 0, floatValue: 0, stringValue: null}, c.AttachmentType = {
            region: 0,
            boundingbox: 1,
            mesh: 2,
            skinnedmesh: 3
        }, c.RegionAttachment = function (a) {
            this.name = a, this.offset = [], this.offset.length = 8, this.uvs = [], this.uvs.length = 8
        }, c.RegionAttachment.prototype = {
            type: c.AttachmentType.region,
            x: 0,
            y: 0,
            rotation: 0,
            scaleX: 1,
            scaleY: 1,
            width: 0,
            height: 0,
            r: 1,
            g: 1,
            b: 1,
            a: 1,
            path: null,
            rendererObject: null,
            regionOffsetX: 0,
            regionOffsetY: 0,
            regionWidth: 0,
            regionHeight: 0,
            regionOriginalWidth: 0,
            regionOriginalHeight: 0,
            setUVs: function (a, b, c, d, e) {
                var f = this.uvs;
                e ? (f[2] = a, f[3] = d, f[4] = a, f[5] = b, f[6] = c, f[7] = b, f[0] = c, f[1] = d) : (f[0] = a, f[1] = d, f[2] = a, f[3] = b, f[4] = c, f[5] = b, f[6] = c, f[7] = d)
            },
            updateOffset: function () {
                var a = this.width / this.regionOriginalWidth * this.scaleX,
                        b = this.height / this.regionOriginalHeight * this.scaleY,
                        d = -this.width / 2 * this.scaleX + this.regionOffsetX * a,
                        e = -this.height / 2 * this.scaleY + this.regionOffsetY * b, f = d + this.regionWidth * a,
                        g = e + this.regionHeight * b, h = this.rotation * c.degRad, i = Math.cos(h), j = Math.sin(h),
                        k = d * i + this.x, l = d * j, m = e * i + this.y, n = e * j, o = f * i + this.x, p = f * j,
                        q = g * i + this.y, r = g * j, s = this.offset;
                s[0] = k - n, s[1] = m + l, s[2] = k - r, s[3] = q + l, s[4] = o - r, s[5] = q + p, s[6] = o - n, s[7] = m + p
            },
            computeVertices: function (a, b, c, d) {
                a += c.worldX, b += c.worldY;
                var e = c.m00, f = c.m01, g = c.m10, h = c.m11, i = this.offset;
                d[0] = i[0] * e + i[1] * f + a, d[1] = i[0] * g + i[1] * h + b, d[2] = i[2] * e + i[3] * f + a, d[3] = i[2] * g + i[3] * h + b, d[4] = i[4] * e + i[5] * f + a, d[5] = i[4] * g + i[5] * h + b, d[6] = i[6] * e + i[7] * f + a, d[7] = i[6] * g + i[7] * h + b
            }
        }, c.MeshAttachment = function (a) {
            this.name = a
        }, c.MeshAttachment.prototype = {
            type: c.AttachmentType.mesh,
            vertices: null,
            uvs: null,
            regionUVs: null,
            triangles: null,
            hullLength: 0,
            r: 1,
            g: 1,
            b: 1,
            a: 1,
            path: null,
            rendererObject: null,
            regionU: 0,
            regionV: 0,
            regionU2: 0,
            regionV2: 0,
            regionRotate: !1,
            regionOffsetX: 0,
            regionOffsetY: 0,
            regionWidth: 0,
            regionHeight: 0,
            regionOriginalWidth: 0,
            regionOriginalHeight: 0,
            edges: null,
            width: 0,
            height: 0,
            updateUVs: function () {
                var a = this.regionU2 - this.regionU, b = this.regionV2 - this.regionV, d = this.regionUVs.length;
                if (this.uvs && this.uvs.length == d || (this.uvs = new c.Float32Array(d)), this.regionRotate) for (var e = 0; d > e; e += 2) this.uvs[e] = this.regionU + this.regionUVs[e + 1] * a, this.uvs[e + 1] = this.regionV + b - this.regionUVs[e] * b; else for (var e = 0; d > e; e += 2) this.uvs[e] = this.regionU + this.regionUVs[e] * a, this.uvs[e + 1] = this.regionV + this.regionUVs[e + 1] * b
            },
            computeWorldVertices: function (a, b, c, d) {
                var e = c.bone;
                a += e.worldX, b += e.worldY;
                var f = e.m00, g = e.m01, h = e.m10, i = e.m11, j = this.vertices, k = j.length;
                c.attachmentVertices.length == k && (j = c.attachmentVertices);
                for (var l = 0; k > l; l += 2) {
                    var m = j[l], n = j[l + 1];
                    d[l] = m * f + n * g + a, d[l + 1] = m * h + n * i + b
                }
            }
        }, c.SkinnedMeshAttachment = function (a) {
            this.name = a
        }, c.SkinnedMeshAttachment.prototype = {
            type: c.AttachmentType.skinnedmesh,
            bones: null,
            weights: null,
            uvs: null,
            regionUVs: null,
            triangles: null,
            hullLength: 0,
            r: 1,
            g: 1,
            b: 1,
            a: 1,
            path: null,
            rendererObject: null,
            regionU: 0,
            regionV: 0,
            regionU2: 0,
            regionV2: 0,
            regionRotate: !1,
            regionOffsetX: 0,
            regionOffsetY: 0,
            regionWidth: 0,
            regionHeight: 0,
            regionOriginalWidth: 0,
            regionOriginalHeight: 0,
            edges: null,
            width: 0,
            height: 0,
            updateUVs: function () {
                var a = this.regionU2 - this.regionU, b = this.regionV2 - this.regionV, d = this.regionUVs.length;
                if (this.uvs && this.uvs.length == d || (this.uvs = new c.Float32Array(d)), this.regionRotate) for (var e = 0; d > e; e += 2) this.uvs[e] = this.regionU + this.regionUVs[e + 1] * a, this.uvs[e + 1] = this.regionV + b - this.regionUVs[e] * b; else for (var e = 0; d > e; e += 2) this.uvs[e] = this.regionU + this.regionUVs[e] * a, this.uvs[e + 1] = this.regionV + this.regionUVs[e + 1] * b
            },
            computeWorldVertices: function (a, b, c, d) {
                var e, f, g, h, i, j, k, l = c.bone.skeleton.bones, m = this.weights, n = this.bones, o = 0, p = 0,
                        q = 0, r = 0, s = n.length;
                if (c.attachmentVertices.length) for (var t = c.attachmentVertices; s > p; o += 2) {
                    for (f = 0, g = 0, e = n[p++] + p; e > p; p++, q += 3, r += 2) h = l[n[p]], i = m[q] + t[r], j = m[q + 1] + t[r + 1], k = m[q + 2], f += (i * h.m00 + j * h.m01 + h.worldX) * k, g += (i * h.m10 + j * h.m11 + h.worldY) * k;
                    d[o] = f + a, d[o + 1] = g + b
                } else for (; s > p; o += 2) {
                    for (f = 0, g = 0, e = n[p++] + p; e > p; p++, q += 3) h = l[n[p]], i = m[q], j = m[q + 1], k = m[q + 2], f += (i * h.m00 + j * h.m01 + h.worldX) * k, g += (i * h.m10 + j * h.m11 + h.worldY) * k;
                    d[o] = f + a, d[o + 1] = g + b
                }
            }
        }, c.BoundingBoxAttachment = function (a) {
            this.name = a, this.vertices = []
        }, c.BoundingBoxAttachment.prototype = {
            type: c.AttachmentType.boundingbox,
            computeWorldVertices: function (a, b, c, d) {
                a += c.worldX, b += c.worldY;
                for (var e = c.m00, f = c.m01, g = c.m10, h = c.m11, i = this.vertices, j = 0, k = i.length; k > j; j += 2) {
                    var l = i[j], m = i[j + 1];
                    d[j] = l * e + m * f + a, d[j + 1] = l * g + m * h + b
                }
            }
        }, c.AnimationStateData = function (a) {
            this.skeletonData = a, this.animationToMixTime = {}
        }, c.AnimationStateData.prototype = {
            defaultMix: 0, setMixByName: function (a, b, c) {
                var d = this.skeletonData.findAnimation(a);
                if (!d) throw"Animation not found: " + a;
                var e = this.skeletonData.findAnimation(b);
                if (!e) throw"Animation not found: " + b;
                this.setMix(d, e, c)
            }, setMix: function (a, b, c) {
                this.animationToMixTime[a.name + ":" + b.name] = c
            }, getMix: function (a, b) {
                var c = a.name + ":" + b.name;
                return this.animationToMixTime.hasOwnProperty(c) ? this.animationToMixTime[c] : this.defaultMix
            }
        }, c.TrackEntry = function () {
        }, c.TrackEntry.prototype = {
            next: null,
            previous: null,
            animation: null,
            loop: !1,
            delay: 0,
            time: 0,
            lastTime: -1,
            endTime: 0,
            timeScale: 1,
            mixTime: 0,
            mixDuration: 0,
            mix: 1,
            onStart: null,
            onEnd: null,
            onComplete: null,
            onEvent: null
        }, c.AnimationState = function (a) {
            this.data = a, this.tracks = [], this.events = []
        }, c.AnimationState.prototype = {
            onStart: null,
            onEnd: null,
            onComplete: null,
            onEvent: null,
            timeScale: 1,
            update: function (a) {
                a *= this.timeScale;
                for (var b = 0; b < this.tracks.length; b++) {
                    var c = this.tracks[b];
                    if (c) {
                        if (c.time += a * c.timeScale, c.previous) {
                            var d = a * c.previous.timeScale;
                            c.previous.time += d, c.mixTime += d
                        }
                        var e = c.next;
                        e ? (e.time = c.lastTime - e.delay, e.time >= 0 && this.setCurrent(b, e)) : !c.loop && c.lastTime >= c.endTime && this.clearTrack(b)
                    }
                }
            },
            apply: function (a) {
                for (var b = 0; b < this.tracks.length; b++) {
                    var c = this.tracks[b];
                    if (c) {
                        this.events.length = 0;
                        var d = c.time, e = c.lastTime, f = c.endTime, g = c.loop;
                        !g && d > f && (d = f);
                        var h = c.previous;
                        if (h) {
                            var i = h.time;
                            !h.loop && i > h.endTime && (i = h.endTime), h.animation.apply(a, i, i, h.loop, null);
                            var j = c.mixTime / c.mixDuration * c.mix;
                            j >= 1 && (j = 1, c.previous = null), c.animation.mix(a, c.lastTime, d, g, this.events, j)
                        } else 1 == c.mix ? c.animation.apply(a, c.lastTime, d, g, this.events) : c.animation.mix(a, c.lastTime, d, g, this.events, c.mix);
                        for (var k = 0, l = this.events.length; l > k; k++) {
                            var m = this.events[k];
                            c.onEvent && c.onEvent(b, m), this.onEvent && this.onEvent(b, m)
                        }
                        if (g ? e % f > d % f : f > e && d >= f) {
                            var n = Math.floor(d / f);
                            c.onComplete && c.onComplete(b, n), this.onComplete && this.onComplete(b, n)
                        }
                        c.lastTime = c.time
                    }
                }
            },
            clearTracks: function () {
                for (var a = 0, b = this.tracks.length; b > a; a++) this.clearTrack(a);
                this.tracks.length = 0
            },
            clearTrack: function (a) {
                if (!(a >= this.tracks.length)) {
                    var b = this.tracks[a];
                    b && (b.onEnd && b.onEnd(a), this.onEnd && this.onEnd(a), this.tracks[a] = null)
                }
            },
            _expandToIndex: function (a) {
                if (a < this.tracks.length) return this.tracks[a];
                for (; a >= this.tracks.length;) this.tracks.push(null);
                return null
            },
            setCurrent: function (a, b) {
                var c = this._expandToIndex(a);
                if (c) {
                    var d = c.previous;
                    c.previous = null, c.onEnd && c.onEnd(a), this.onEnd && this.onEnd(a), b.mixDuration = this.data.getMix(c.animation, b.animation), b.mixDuration > 0 && (b.mixTime = 0, b.previous = d && c.mixTime / c.mixDuration < .5 ? d : c)
                }
                this.tracks[a] = b, b.onStart && b.onStart(a), this.onStart && this.onStart(a)
            },
            setAnimationByName: function (a, b, c) {
                var d = this.data.skeletonData.findAnimation(b);
                if (!d) throw"Animation not found: " + b;
                return this.setAnimation(a, d, c)
            },
            setAnimation: function (a, b, d) {
                var e = new c.TrackEntry;
                return e.animation = b, e.loop = d, e.endTime = b.duration, this.setCurrent(a, e), e
            },
            addAnimationByName: function (a, b, c, d) {
                var e = this.data.skeletonData.findAnimation(b);
                if (!e) throw"Animation not found: " + b;
                return this.addAnimation(a, e, c, d)
            },
            addAnimation: function (a, b, d, e) {
                var f = new c.TrackEntry;
                f.animation = b, f.loop = d, f.endTime = b.duration;
                var g = this._expandToIndex(a);
                if (g) {
                    for (; g.next;) g = g.next;
                    g.next = f
                } else this.tracks[a] = f;
                return 0 >= e && (g ? e += g.endTime - this.data.getMix(g.animation, b) : e = 0), f.delay = e, f
            },
            getCurrent: function (a) {
                return a >= this.tracks.length ? null : this.tracks[a]
            }
        }, c.SkeletonJson = function (a) {
            this.attachmentLoader = a
        }, c.SkeletonJson.prototype = {
            scale: 1, readSkeletonData: function (a, b) {
                var d = new c.SkeletonData;
                d.name = b;
                var e = a.skeleton;
                e && (d.hash = e.hash, d.version = e.spine, d.width = e.width || 0, d.height = e.height || 0);
                for (var f = a.bones, g = 0, h = f.length; h > g; g++) {
                    var i = f[g], j = null;
                    if (i.parent && (j = d.findBone(i.parent), !j)) throw"Parent bone not found: " + i.parent;
                    var k = new c.BoneData(i.name, j);
                    k.length = (i.length || 0) * this.scale, k.x = (i.x || 0) * this.scale, k.y = (i.y || 0) * this.scale, k.rotation = i.rotation || 0, k.scaleX = i.hasOwnProperty("scaleX") ? i.scaleX : 1, k.scaleY = i.hasOwnProperty("scaleY") ? i.scaleY : 1, k.inheritScale = i.hasOwnProperty("inheritScale") ? i.inheritScale : !0, k.inheritRotation = i.hasOwnProperty("inheritRotation") ? i.inheritRotation : !0, d.bones.push(k)
                }
                var l = a.ik;
                if (l) for (var g = 0, h = l.length; h > g; g++) {
                    for (var m = l[g], n = new c.IkConstraintData(m.name), f = m.bones, o = 0, p = f.length; p > o; o++) {
                        var q = d.findBone(f[o]);
                        if (!q) throw"IK bone not found: " + f[o];
                        n.bones.push(q)
                    }
                    if (n.target = d.findBone(m.target), !n.target) throw"Target bone not found: " + m.target;
                    n.bendDirection = !m.hasOwnProperty("bendPositive") || m.bendPositive ? 1 : -1, n.mix = m.hasOwnProperty("mix") ? m.mix : 1, d.ikConstraints.push(n)
                }
                for (var r = a.slots, g = 0, h = r.length; h > g; g++) {
                    var s = r[g], k = d.findBone(s.bone);
                    if (!k) throw"Slot bone not found: " + s.bone;
                    var t = new c.SlotData(s.name, k), u = s.color;
                    u && (t.r = this.toColor(u, 0), t.g = this.toColor(u, 1), t.b = this.toColor(u, 2), t.a = this.toColor(u, 3)), t.attachmentName = s.attachment, t.additiveBlending = s.additive && "true" == s.additive, d.slots.push(t)
                }
                var v = a.skins;
                for (var w in v) if (v.hasOwnProperty(w)) {
                    var x = v[w], y = new c.Skin(w);
                    for (var z in x) if (x.hasOwnProperty(z)) {
                        var A = d.findSlotIndex(z), B = x[z];
                        for (var C in B) if (B.hasOwnProperty(C)) {
                            var D = this.readAttachment(y, C, B[C]);
                            D && y.addAttachment(A, C, D)
                        }
                    }
                    d.skins.push(y), "default" == y.name && (d.defaultSkin = y)
                }
                var E = a.events;
                for (var F in E) if (E.hasOwnProperty(F)) {
                    var G = E[F], H = new c.EventData(F);
                    H.intValue = G["int"] || 0, H.floatValue = G["float"] || 0, H.stringValue = G.string || null, d.events.push(H)
                }
                var I = a.animations;
                for (var J in I) I.hasOwnProperty(J) && this.readAnimation(J, I[J], d);
                return d
            }, readAttachment: function (a, b, d) {
                b = d.name || b;
                var e = c.AttachmentType[d.type || "region"], f = d.path || b, g = this.scale;
                if (e == c.AttachmentType.region) {
                    var h = this.attachmentLoader.newRegionAttachment(a, b, f);
                    if (!h) return null;
                    h.path = f, h.x = (d.x || 0) * g, h.y = (d.y || 0) * g, h.scaleX = d.hasOwnProperty("scaleX") ? d.scaleX : 1, h.scaleY = d.hasOwnProperty("scaleY") ? d.scaleY : 1, h.rotation = d.rotation || 0, h.width = (d.width || 0) * g, h.height = (d.height || 0) * g;
                    var i = d.color;
                    return i && (h.r = this.toColor(i, 0), h.g = this.toColor(i, 1), h.b = this.toColor(i, 2), h.a = this.toColor(i, 3)), h.updateOffset(), h
                }
                if (e == c.AttachmentType.mesh) {
                    var j = this.attachmentLoader.newMeshAttachment(a, b, f);
                    return j ? (j.path = f, j.vertices = this.getFloatArray(d, "vertices", g), j.triangles = this.getIntArray(d, "triangles"), j.regionUVs = this.getFloatArray(d, "uvs", 1), j.updateUVs(), i = d.color, i && (j.r = this.toColor(i, 0), j.g = this.toColor(i, 1), j.b = this.toColor(i, 2), j.a = this.toColor(i, 3)), j.hullLength = 2 * (d.hull || 0), d.edges && (j.edges = this.getIntArray(d, "edges")), j.width = (d.width || 0) * g, j.height = (d.height || 0) * g, j) : null
                }
                if (e == c.AttachmentType.skinnedmesh) {
                    var j = this.attachmentLoader.newSkinnedMeshAttachment(a, b, f);
                    if (!j) return null;
                    j.path = f;
                    for (var k = this.getFloatArray(d, "uvs", 1), l = this.getFloatArray(d, "vertices", 1), m = [], n = [], o = 0, p = l.length; p > o;) {
                        var q = 0 | l[o++];
                        n[n.length] = q;
                        for (var r = o + 4 * q; r > o;) n[n.length] = l[o], m[m.length] = l[o + 1] * g, m[m.length] = l[o + 2] * g, m[m.length] = l[o + 3], o += 4
                    }
                    return j.bones = n, j.weights = m, j.triangles = this.getIntArray(d, "triangles"), j.regionUVs = k, j.updateUVs(), i = d.color, i && (j.r = this.toColor(i, 0), j.g = this.toColor(i, 1), j.b = this.toColor(i, 2), j.a = this.toColor(i, 3)), j.hullLength = 2 * (d.hull || 0), d.edges && (j.edges = this.getIntArray(d, "edges")), j.width = (d.width || 0) * g, j.height = (d.height || 0) * g, j
                }
                if (e == c.AttachmentType.boundingbox) {
                    for (var s = this.attachmentLoader.newBoundingBoxAttachment(a, b), l = d.vertices, o = 0, p = l.length; p > o; o++) s.vertices.push(l[o] * g);
                    return s
                }
                throw"Unknown attachment type: " + e
            }, readAnimation: function (a, b, d) {
                var e = [], f = 0, g = b.slots;
                for (var h in g) if (g.hasOwnProperty(h)) {
                    var i = g[h], j = d.findSlotIndex(h);
                    for (var k in i) if (i.hasOwnProperty(k)) {
                        var l = i[k];
                        if ("color" == k) {
                            var m = new c.ColorTimeline(l.length);
                            m.slotIndex = j;
                            for (var n = 0, o = 0, p = l.length; p > o; o++) {
                                var q = l[o], r = q.color, s = this.toColor(r, 0), t = this.toColor(r, 1),
                                        u = this.toColor(r, 2), v = this.toColor(r, 3);
                                m.setFrame(n, q.time, s, t, u, v), this.readCurve(m, n, q), n++
                            }
                            e.push(m), f = Math.max(f, m.frames[5 * m.getFrameCount() - 5])
                        } else {
                            if ("attachment" != k) throw"Invalid timeline type for a slot: " + k + " (" + h + ")";
                            var m = new c.AttachmentTimeline(l.length);
                            m.slotIndex = j;
                            for (var n = 0, o = 0, p = l.length; p > o; o++) {
                                var q = l[o];
                                m.setFrame(n++, q.time, q.name)
                            }
                            e.push(m), f = Math.max(f, m.frames[m.getFrameCount() - 1])
                        }
                    }
                }
                var w = b.bones;
                for (var x in w) if (w.hasOwnProperty(x)) {
                    var y = d.findBoneIndex(x);
                    if (-1 == y) throw"Bone not found: " + x;
                    var z = w[x];
                    for (var k in z) if (z.hasOwnProperty(k)) {
                        var l = z[k];
                        if ("rotate" == k) {
                            var m = new c.RotateTimeline(l.length);
                            m.boneIndex = y;
                            for (var n = 0, o = 0, p = l.length; p > o; o++) {
                                var q = l[o];
                                m.setFrame(n, q.time, q.angle), this.readCurve(m, n, q), n++
                            }
                            e.push(m), f = Math.max(f, m.frames[2 * m.getFrameCount() - 2])
                        } else if ("translate" == k || "scale" == k) {
                            var m, A = 1;
                            "scale" == k ? m = new c.ScaleTimeline(l.length) : (m = new c.TranslateTimeline(l.length), A = this.scale), m.boneIndex = y;
                            for (var n = 0, o = 0, p = l.length; p > o; o++) {
                                var q = l[o], B = (q.x || 0) * A, C = (q.y || 0) * A;
                                m.setFrame(n, q.time, B, C), this.readCurve(m, n, q), n++
                            }
                            e.push(m), f = Math.max(f, m.frames[3 * m.getFrameCount() - 3])
                        } else {
                            if ("flipX" != k && "flipY" != k) throw"Invalid timeline type for a bone: " + k + " (" + x + ")";
                            var B = "flipX" == k, m = B ? new c.FlipXTimeline(l.length) : new c.FlipYTimeline(l.length);
                            m.boneIndex = y;
                            for (var D = B ? "x" : "y", n = 0, o = 0, p = l.length; p > o; o++) {
                                var q = l[o];
                                m.setFrame(n, q.time, q[D] || !1), n++
                            }
                            e.push(m), f = Math.max(f, m.frames[2 * m.getFrameCount() - 2])
                        }
                    }
                }
                var E = b.ik;
                for (var F in E) if (E.hasOwnProperty(F)) {
                    var G = d.findIkConstraint(F), l = E[F], m = new c.IkConstraintTimeline(l.length);
                    m.ikConstraintIndex = d.ikConstraints.indexOf(G);
                    for (var n = 0, o = 0, p = l.length; p > o; o++) {
                        var q = l[o], H = q.hasOwnProperty("mix") ? q.mix : 1,
                                I = !q.hasOwnProperty("bendPositive") || q.bendPositive ? 1 : -1;
                        m.setFrame(n, q.time, H, I), this.readCurve(m, n, q), n++
                    }
                    e.push(m), f = Math.max(f, m.frames[3 * m.frameCount - 3])
                }
                var J = b.ffd;
                for (var K in J) {
                    var L = d.findSkin(K), i = J[K];
                    for (h in i) {
                        var j = d.findSlotIndex(h), M = i[h];
                        for (var N in M) {
                            var l = M[N], m = new c.FfdTimeline(l.length), O = L.getAttachment(j, N);
                            if (!O) throw"FFD attachment not found: " + N;
                            m.slotIndex = j, m.attachment = O;
                            var P, Q = O.type == c.AttachmentType.mesh;
                            P = Q ? O.vertices.length : O.weights.length / 3 * 2;
                            for (var n = 0, o = 0, p = l.length; p > o; o++) {
                                var R, q = l[o];
                                if (q.vertices) {
                                    var S = q.vertices, R = [];
                                    R.length = P;
                                    var T = q.offset || 0, U = S.length;
                                    if (1 == this.scale) for (var V = 0; U > V; V++) R[V + T] = S[V]; else for (var V = 0; U > V; V++) R[V + T] = S[V] * this.scale;
                                    if (Q) for (var W = O.vertices, V = 0, U = R.length; U > V; V++) R[V] += W[V]
                                } else Q ? R = O.vertices : (R = [], R.length = P);
                                m.setFrame(n, q.time, R), this.readCurve(m, n, q), n++
                            }
                            e[e.length] = m, f = Math.max(f, m.frames[m.frameCount - 1])
                        }
                    }
                }
                var X = b.drawOrder;
                if (X || (X = b.draworder), X) {
                    for (var m = new c.DrawOrderTimeline(X.length), Y = d.slots.length, n = 0, o = 0, p = X.length; p > o; o++) {
                        var Z = X[o], $ = null;
                        if (Z.offsets) {
                            $ = [], $.length = Y;
                            for (var V = Y - 1; V >= 0; V--) $[V] = -1;
                            var _ = Z.offsets, ab = [];
                            ab.length = Y - _.length;
                            for (var bb = 0, cb = 0, V = 0, U = _.length; U > V; V++) {
                                var db = _[V], j = d.findSlotIndex(db.slot);
                                if (-1 == j) throw"Slot not found: " + db.slot;
                                for (; bb != j;) ab[cb++] = bb++;
                                $[bb + db.offset] = bb++
                            }
                            for (; Y > bb;) ab[cb++] = bb++;
                            for (var V = Y - 1; V >= 0; V--) -1 == $[V] && ($[V] = ab[--cb])
                        }
                        m.setFrame(n++, Z.time, $)
                    }
                    e.push(m), f = Math.max(f, m.frames[m.getFrameCount() - 1])
                }
                var eb = b.events;
                if (eb) {
                    for (var m = new c.EventTimeline(eb.length), n = 0, o = 0, p = eb.length; p > o; o++) {
                        var fb = eb[o], gb = d.findEvent(fb.name);
                        if (!gb) throw"Event not found: " + fb.name;
                        var hb = new c.Event(gb);
                        hb.intValue = fb.hasOwnProperty("int") ? fb["int"] : gb.intValue, hb.floatValue = fb.hasOwnProperty("float") ? fb["float"] : gb.floatValue, hb.stringValue = fb.hasOwnProperty("string") ? fb.string : gb.stringValue, m.setFrame(n++, fb.time, hb)
                    }
                    e.push(m), f = Math.max(f, m.frames[m.getFrameCount() - 1])
                }
                d.animations.push(new c.Animation(a, e, f))
            }, readCurve: function (a, b, c) {
                var d = c.curve;
                d ? "stepped" == d ? a.curves.setStepped(b) : d instanceof Array && a.curves.setCurve(b, d[0], d[1], d[2], d[3]) : a.curves.setLinear(b)
            }, toColor: function (a, b) {
                if (8 != a.length) throw"Color hexidecimal length must be 8, recieved: " + a;
                return parseInt(a.substring(2 * b, 2 * b + 2), 16) / 255
            }, getFloatArray: function (a, b, d) {
                var e = a[b], f = new c.Float32Array(e.length), g = 0, h = e.length;
                if (1 == d) for (; h > g; g++) f[g] = e[g]; else for (; h > g; g++) f[g] = e[g] * d;
                return f
            }, getIntArray: function (a, b) {
                for (var d = a[b], e = new c.Uint16Array(d.length), f = 0, g = d.length; g > f; f++) e[f] = 0 | d[f];
                return e
            }
        }, c.Atlas = function (a, b) {
            this.textureLoader = b, this.pages = [], this.regions = [];
            var d = new c.AtlasReader(a), e = [];
            e.length = 4;
            for (var f = null; ;) {
                var g = d.readLine();
                if (null === g) break;
                if (g = d.trim(g), g.length) if (f) {
                    var h = new c.AtlasRegion;
                    h.name = g, h.page = f, h.rotate = "true" == d.readValue(), d.readTuple(e);
                    var i = parseInt(e[0]), j = parseInt(e[1]);
                    d.readTuple(e);
                    var k = parseInt(e[0]), l = parseInt(e[1]);
                    h.u = i / f.width, h.v = j / f.height, h.rotate ? (h.u2 = (i + l) / f.width, h.v2 = (j + k) / f.height) : (h.u2 = (i + k) / f.width, h.v2 = (j + l) / f.height), h.x = i, h.y = j, h.width = Math.abs(k), h.height = Math.abs(l), 4 == d.readTuple(e) && (h.splits = [parseInt(e[0]), parseInt(e[1]), parseInt(e[2]), parseInt(e[3])], 4 == d.readTuple(e) && (h.pads = [parseInt(e[0]), parseInt(e[1]), parseInt(e[2]), parseInt(e[3])], d.readTuple(e))), h.originalWidth = parseInt(e[0]), h.originalHeight = parseInt(e[1]), d.readTuple(e), h.offsetX = parseInt(e[0]), h.offsetY = parseInt(e[1]), h.index = parseInt(d.readValue()), this.regions.push(h)
                } else {
                    f = new c.AtlasPage, f.name = g, 2 == d.readTuple(e) && (f.width = parseInt(e[0]), f.height = parseInt(e[1]), d.readTuple(e)), f.format = c.Atlas.Format[e[0]], d.readTuple(e), f.minFilter = c.Atlas.TextureFilter[e[0]], f.magFilter = c.Atlas.TextureFilter[e[1]];
                    var m = d.readValue();
                    f.uWrap = c.Atlas.TextureWrap.clampToEdge, f.vWrap = c.Atlas.TextureWrap.clampToEdge, "x" == m ? f.uWrap = c.Atlas.TextureWrap.repeat : "y" == m ? f.vWrap = c.Atlas.TextureWrap.repeat : "xy" == m && (f.uWrap = f.vWrap = c.Atlas.TextureWrap.repeat), b.load(f, g, this), this.pages.push(f)
                } else f = null
            }
        }, c.Atlas.prototype = {
            findRegion: function (a) {
                for (var b = this.regions, c = 0, d = b.length; d > c; c++) if (b[c].name == a) return b[c];
                return null
            }, dispose: function () {
                for (var a = this.pages, b = 0, c = a.length; c > b; b++) this.textureLoader.unload(a[b].rendererObject)
            }, updateUVs: function (a) {
                for (var b = this.regions, c = 0, d = b.length; d > c; c++) {
                    var e = b[c];
                    e.page == a && (e.u = e.x / a.width, e.v = e.y / a.height, e.rotate ? (e.u2 = (e.x + e.height) / a.width, e.v2 = (e.y + e.width) / a.height) : (e.u2 = (e.x + e.width) / a.width, e.v2 = (e.y + e.height) / a.height))
                }
            }
        }, c.Atlas.Format = {
            alpha: 0,
            intensity: 1,
            luminanceAlpha: 2,
            rgb565: 3,
            rgba4444: 4,
            rgb888: 5,
            rgba8888: 6
        }, c.Atlas.TextureFilter = {
            nearest: 0,
            linear: 1,
            mipMap: 2,
            mipMapNearestNearest: 3,
            mipMapLinearNearest: 4,
            mipMapNearestLinear: 5,
            mipMapLinearLinear: 6
        }, c.Atlas.TextureWrap = {mirroredRepeat: 0, clampToEdge: 1, repeat: 2}, c.AtlasPage = function () {
        }, c.AtlasPage.prototype = {
            name: null,
            format: null,
            minFilter: null,
            magFilter: null,
            uWrap: null,
            vWrap: null,
            rendererObject: null,
            width: 0,
            height: 0
        }, c.AtlasRegion = function () {
        }, c.AtlasRegion.prototype = {
            page: null,
            name: null,
            x: 0,
            y: 0,
            width: 0,
            height: 0,
            u: 0,
            v: 0,
            u2: 0,
            v2: 0,
            offsetX: 0,
            offsetY: 0,
            originalWidth: 0,
            originalHeight: 0,
            index: 0,
            rotate: !1,
            splits: null,
            pads: null
        }, c.AtlasReader = function (a) {
            this.lines = a.split(/\r\n|\r|\n/)
        }, c.AtlasReader.prototype = {
            index: 0, trim: function (a) {
                return a.replace(/^\s+|\s+$/g, "")
            }, readLine: function () {
                return this.index >= this.lines.length ? null : this.lines[this.index++]
            }, readValue: function () {
                var a = this.readLine(), b = a.indexOf(":");
                if (-1 == b) throw"Invalid line: " + a;
                return this.trim(a.substring(b + 1))
            }, readTuple: function (a) {
                var b = this.readLine(), c = b.indexOf(":");
                if (-1 == c) throw"Invalid line: " + b;
                for (var d = 0, e = c + 1; 3 > d; d++) {
                    var f = b.indexOf(",", e);
                    if (-1 == f) break;
                    a[d] = this.trim(b.substr(e, f - e)), e = f + 1
                }
                return a[d] = this.trim(b.substring(e)), d + 1
            }
        }, c.AtlasAttachmentLoader = function (a) {
            this.atlas = a
        }, c.AtlasAttachmentLoader.prototype = {
            newRegionAttachment: function (a, b, d) {
                var e = this.atlas.findRegion(d);
                if (!e) throw"Region not found in atlas: " + d + " (region attachment: " + b + ")";
                var f = new c.RegionAttachment(b);
                return f.rendererObject = e, f.setUVs(e.u, e.v, e.u2, e.v2, e.rotate), f.regionOffsetX = e.offsetX, f.regionOffsetY = e.offsetY, f.regionWidth = e.width, f.regionHeight = e.height, f.regionOriginalWidth = e.originalWidth, f.regionOriginalHeight = e.originalHeight, f
            }, newMeshAttachment: function (a, b, d) {
                var e = this.atlas.findRegion(d);
                if (!e) throw"Region not found in atlas: " + d + " (mesh attachment: " + b + ")";
                var f = new c.MeshAttachment(b);
                return f.rendererObject = e, f.regionU = e.u, f.regionV = e.v, f.regionU2 = e.u2, f.regionV2 = e.v2, f.regionRotate = e.rotate, f.regionOffsetX = e.offsetX, f.regionOffsetY = e.offsetY, f.regionWidth = e.width, f.regionHeight = e.height, f.regionOriginalWidth = e.originalWidth, f.regionOriginalHeight = e.originalHeight, f
            }, newSkinnedMeshAttachment: function (a, b, d) {
                var e = this.atlas.findRegion(d);
                if (!e) throw"Region not found in atlas: " + d + " (skinned mesh attachment: " + b + ")";
                var f = new c.SkinnedMeshAttachment(b);
                return f.rendererObject = e, f.regionU = e.u, f.regionV = e.v, f.regionU2 = e.u2, f.regionV2 = e.v2, f.regionRotate = e.rotate, f.regionOffsetX = e.offsetX, f.regionOffsetY = e.offsetY, f.regionWidth = e.width, f.regionHeight = e.height, f.regionOriginalWidth = e.originalWidth, f.regionOriginalHeight = e.originalHeight, f
            }, newBoundingBoxAttachment: function (a, b) {
                return new c.BoundingBoxAttachment(b)
            }
        }, c.SkeletonBounds = function () {
            this.polygonPool = [], this.polygons = [], this.boundingBoxes = []
        }, c.SkeletonBounds.prototype = {
            minX: 0, minY: 0, maxX: 0, maxY: 0, update: function (a, b) {
                var d = a.slots, e = d.length, f = a.x, g = a.y, h = this.boundingBoxes, i = this.polygonPool,
                        j = this.polygons;
                h.length = 0;
                for (var k = 0, l = j.length; l > k; k++) i.push(j[k]);
                j.length = 0;
                for (var k = 0; e > k; k++) {
                    var m = d[k], n = m.attachment;
                    if (n.type == c.AttachmentType.boundingbox) {
                        h.push(n);
                        var o, p = i.length;
                        p > 0 ? (o = i[p - 1], i.splice(p - 1, 1)) : o = [], j.push(o), o.length = n.vertices.length, n.computeWorldVertices(f, g, m.bone, o)
                    }
                }
                b && this.aabbCompute()
            }, aabbCompute: function () {
                for (var a = this.polygons, b = Number.MAX_VALUE, c = Number.MAX_VALUE, d = Number.MIN_VALUE, e = Number.MIN_VALUE, f = 0, g = a.length; g > f; f++) for (var h = a[f], i = 0, j = h.length; j > i; i += 2) {
                    var k = h[i], l = h[i + 1];
                    b = Math.min(b, k), c = Math.min(c, l), d = Math.max(d, k), e = Math.max(e, l)
                }
                this.minX = b, this.minY = c, this.maxX = d, this.maxY = e
            }, aabbContainsPoint: function (a, b) {
                return a >= this.minX && a <= this.maxX && b >= this.minY && b <= this.maxY
            }, aabbIntersectsSegment: function (a, b, c, d) {
                var e = this.minX, f = this.minY, g = this.maxX, h = this.maxY;
                if (e >= a && e >= c || f >= b && f >= d || a >= g && c >= g || b >= h && d >= h) return !1;
                var i = (d - b) / (c - a), j = i * (e - a) + b;
                if (j > f && h > j) return !0;
                if (j = i * (g - a) + b, j > f && h > j) return !0;
                var k = (f - b) / i + a;
                return k > e && g > k ? !0 : (k = (h - b) / i + a, k > e && g > k ? !0 : !1)
            }, aabbIntersectsSkeleton: function (a) {
                return this.minX < a.maxX && this.maxX > a.minX && this.minY < a.maxY && this.maxY > a.minY
            }, containsPoint: function (a, b) {
                for (var c = this.polygons, d = 0, e = c.length; e > d; d++) if (this.polygonContainsPoint(c[d], a, b)) return this.boundingBoxes[d];
                return null
            }, intersectsSegment: function (a, b, c, d) {
                for (var e = this.polygons, f = 0, g = e.length; g > f; f++) if (e[f].intersectsSegment(a, b, c, d)) return this.boundingBoxes[f];
                return null
            }, polygonContainsPoint: function (a, b, c) {
                for (var d = a.length, e = d - 2, f = !1, g = 0; d > g; g += 2) {
                    var h = a[g + 1], i = a[e + 1];
                    if (c > h && i >= c || c > i && h >= c) {
                        var j = a[g];
                        j + (c - h) / (i - h) * (a[e] - j) < b && (f = !f)
                    }
                    e = g
                }
                return f
            }, polygonIntersectsSegment: function (a, b, c, d, e) {
                for (var f = a.length, g = b - d, h = c - e, i = b * e - c * d, j = a[f - 2], k = a[f - 1], l = 0; f > l; l += 2) {
                    var m = a[l], n = a[l + 1], o = j * n - k * m, p = j - m, q = k - n, r = g * q - h * p,
                            s = (i * p - g * o) / r;
                    if ((s >= j && m >= s || s >= m && j >= s) && (s >= b && d >= s || s >= d && b >= s)) {
                        var t = (i * q - h * o) / r;
                        if ((t >= k && n >= t || t >= n && k >= t) && (t >= c && e >= t || t >= e && c >= t)) return !0
                    }
                    j = m, k = n
                }
                return !1
            }, getPolygon: function (a) {
                var b = this.boundingBoxes.indexOf(a);
                return -1 == b ? null : this.polygons[b]
            }, getWidth: function () {
                return this.maxX - this.minX
            }, getHeight: function () {
                return this.maxY - this.minY
            }
        }, c.Bone.yDown = !0, b.AnimCache = {}, b.SpineTextureLoader = function (a, c) {
            b.EventTarget.call(this), this.basePath = a, this.crossorigin = c, this.loadingCount = 0
        }, b.SpineTextureLoader.prototype = b.SpineTextureLoader, b.SpineTextureLoader.prototype.load = function (a, c) {
            if (a.rendererObject = b.BaseTexture.fromImage(this.basePath + "/" + c, this.crossorigin), !a.rendererObject.hasLoaded) {
                var d = this;
                ++d.loadingCount, a.rendererObject.addEventListener("loaded", function () {
                    --d.loadingCount, d.dispatchEvent({type: "loadedBaseTexture", content: d})
                })
            }
        }, b.SpineTextureLoader.prototype.unload = function (a) {
            a.destroy(!0)
        }, b.Spine = function (a) {
            if (b.DisplayObjectContainer.call(this), this.spineData = b.AnimCache[a], !this.spineData) throw new Error("Spine data must be preloaded using PIXI.SpineLoader or PIXI.AssetLoader: " + a);
            this.skeleton = new c.Skeleton(this.spineData), this.skeleton.updateWorldTransform(), this.stateData = new c.AnimationStateData(this.spineData), this.state = new c.AnimationState(this.stateData), this.slotContainers = [];
            for (var d = 0, e = this.skeleton.drawOrder.length; e > d; d++) {
                var f = this.skeleton.drawOrder[d], g = f.attachment, h = new b.DisplayObjectContainer;
                if (this.slotContainers.push(h), this.addChild(h), g instanceof c.RegionAttachment) {
                    var i = g.rendererObject.name, j = this.createSprite(f, g);
                    f.currentSprite = j, f.currentSpriteName = i, h.addChild(j)
                } else {
                    if (!(g instanceof c.MeshAttachment)) continue;
                    var k = this.createMesh(f, g);
                    f.currentMesh = k, f.currentMeshName = g.name, h.addChild(k)
                }
            }
            this.autoUpdate = !0
        }, b.Spine.prototype = Object.create(b.DisplayObjectContainer.prototype), b.Spine.prototype.constructor = b.Spine, Object.defineProperty(b.Spine.prototype, "autoUpdate", {
            get: function () {
                return this.updateTransform === b.Spine.prototype.autoUpdateTransform
            }, set: function (a) {
                this.updateTransform = a ? b.Spine.prototype.autoUpdateTransform : b.DisplayObjectContainer.prototype.updateTransform
            }
        }), b.Spine.prototype.update = function (a) {
            this.state.update(a), this.state.apply(this.skeleton), this.skeleton.updateWorldTransform();
            for (var d = this.skeleton.drawOrder, e = 0, f = d.length; f > e; e++) {
                var g = d[e], h = g.attachment, i = this.slotContainers[e];
                if (h) {
                    var j = h.type;
                    if (j === c.AttachmentType.region) {
                        if (h.rendererObject && (!g.currentSpriteName || g.currentSpriteName !== h.name)) {
                            var k = h.rendererObject.name;
                            if (void 0 !== g.currentSprite && (g.currentSprite.visible = !1), g.sprites = g.sprites || {}, void 0 !== g.sprites[k]) g.sprites[k].visible = !0; else {
                                var l = this.createSprite(g, h);
                                i.addChild(l)
                            }
                            g.currentSprite = g.sprites[k], g.currentSpriteName = k
                        }
                        var m = g.bone;
                        i.position.x = m.worldX + h.x * m.m00 + h.y * m.m01, i.position.y = m.worldY + h.x * m.m10 + h.y * m.m11, i.scale.x = m.worldScaleX, i.scale.y = m.worldScaleY, i.rotation = -(g.bone.worldRotation * c.degRad), g.currentSprite.tint = b.rgb2hex([g.r, g.g, g.b])
                    } else {
                        if (j !== c.AttachmentType.skinnedmesh) {
                            i.visible = !1;
                            continue
                        }
                        if (!g.currentMeshName || g.currentMeshName !== h.name) {
                            var n = h.name;
                            if (void 0 !== g.currentMesh && (g.currentMesh.visible = !1), g.meshes = g.meshes || {}, void 0 !== g.meshes[n]) g.meshes[n].visible = !0; else {
                                var o = this.createMesh(g, h);
                                i.addChild(o)
                            }
                            g.currentMesh = g.meshes[n], g.currentMeshName = n
                        }
                        h.computeWorldVertices(g.bone.skeleton.x, g.bone.skeleton.y, g, g.currentMesh.vertices)
                    }
                    i.visible = !0, i.alpha = g.a
                } else i.visible = !1
            }
        }, b.Spine.prototype.autoUpdateTransform = function () {
            this.lastTime = this.lastTime || Date.now();
            var a = .001 * (Date.now() - this.lastTime);
            this.lastTime = Date.now(), this.update(a), b.DisplayObjectContainer.prototype.updateTransform.call(this)
        }, b.Spine.prototype.createSprite = function (a, d) {
            var e = d.rendererObject, f = e.page.rendererObject,
                    g = new b.Rectangle(e.x, e.y, e.rotate ? e.height : e.width, e.rotate ? e.width : e.height),
                    h = new b.Texture(f, g), i = new b.Sprite(h), j = e.rotate ? .5 * Math.PI : 0;
            return i.scale.set(e.width / e.originalWidth, e.height / e.originalHeight), i.rotation = j - d.rotation * c.degRad, i.anchor.x = i.anchor.y = .5, a.sprites = a.sprites || {}, a.sprites[e.name] = i, i
        }, b.Spine.prototype.createMesh = function (a, c) {
            var d = c.rendererObject, e = d.page.rendererObject, f = new b.Texture(e), g = new b.Strip(f);
            return g.drawMode = b.Strip.DrawModes.TRIANGLES, g.canvasPadding = 1.5, g.vertices = new b.Float32Array(c.uvs.length), g.uvs = c.uvs, g.indices = c.triangles, a.meshes = a.meshes || {}, a.meshes[c.name] = g, g
        }, b.BaseTextureCache = {},b.BaseTextureCacheIdGenerator = 0,b.BaseTexture = function (a, c) {
            if (this.resolution = 1, this.width = 100, this.height = 100, this.scaleMode = c || b.scaleModes.DEFAULT, this.hasLoaded = !1, this.source = a, this._UID = b._UID++, this.premultipliedAlpha = !0, this._glTextures = [], this.mipmap = !1, this._dirty = [!0, !0, !0, !0], a) {
                if ((this.source.complete || this.source.getContext) && this.source.width && this.source.height) this.hasLoaded = !0, this.width = this.source.naturalWidth || this.source.width, this.height = this.source.naturalHeight || this.source.height, this.dirty(); else {
                    var d = this;
                    this.source.onload = function () {
                        d.hasLoaded = !0, d.width = d.source.naturalWidth || d.source.width, d.height = d.source.naturalHeight || d.source.height, d.dirty(), d.dispatchEvent({
                            type: "loaded",
                            content: d
                        })
                    }, this.source.onerror = function () {
                        d.dispatchEvent({type: "error", content: d})
                    }
                }
                this.imageUrl = null, this._powerOf2 = !1
            }
        },b.BaseTexture.prototype.constructor = b.BaseTexture,b.EventTarget.mixin(b.BaseTexture.prototype),b.BaseTexture.prototype.destroy = function () {
            this.imageUrl ? (delete b.BaseTextureCache[this.imageUrl], delete b.TextureCache[this.imageUrl], this.imageUrl = null, navigator.isCocoonJS || (this.source.src = "")) : this.source && this.source._pixiId && delete b.BaseTextureCache[this.source._pixiId], this.source = null, this.unloadFromGPU()
        },b.BaseTexture.prototype.updateSourceImage = function (a) {
            this.hasLoaded = !1, this.source.src = null, this.source.src = a
        },b.BaseTexture.prototype.dirty = function () {
            for (var a = 0; a < this._glTextures.length; a++) this._dirty[a] = !0
        },b.BaseTexture.prototype.unloadFromGPU = function () {
            this.dirty();
            for (var a = this._glTextures.length - 1; a >= 0; a--) {
                var c = this._glTextures[a], d = b.glContexts[a];
                d && c && d.deleteTexture(c)
            }
            this._glTextures.length = 0, this.dirty()
        },b.BaseTexture.fromImage = function (a, c, d) {
            var e = b.BaseTextureCache[a];
            if (void 0 === c && -1 === a.indexOf("data:") && (c = !0), !e) {
                var f = new Image;
                c && (f.crossOrigin = ""), f.src = a, e = new b.BaseTexture(f, d), e.imageUrl = a, b.BaseTextureCache[a] = e, -1 !== a.indexOf(b.RETINA_PREFIX + ".") && (e.resolution = 2)
            }
            return e
        },b.BaseTexture.fromCanvas = function (a, c) {
            a._pixiId || (a._pixiId = "canvas_" + b.TextureCacheIdGenerator++);
            var d = b.BaseTextureCache[a._pixiId];
            return d || (d = new b.BaseTexture(a, c), b.BaseTextureCache[a._pixiId] = d), d
        },b.TextureCache = {},b.FrameCache = {},b.TextureCacheIdGenerator = 0,b.Texture = function (a, c, d, e) {
            this.noFrame = !1, c || (this.noFrame = !0, c = new b.Rectangle(0, 0, 1, 1)), a instanceof b.Texture && (a = a.baseTexture), this.baseTexture = a, this.frame = c, this.trim = e, this.valid = !1, this.requiresUpdate = !1, this._uvs = null, this.width = 0, this.height = 0, this.crop = d || new b.Rectangle(0, 0, 1, 1), a.hasLoaded ? (this.noFrame && (c = new b.Rectangle(0, 0, a.width, a.height)), this.setFrame(c)) : a.addEventListener("loaded", this.onBaseTextureLoaded.bind(this))
        },b.Texture.prototype.constructor = b.Texture,b.EventTarget.mixin(b.Texture.prototype),b.Texture.prototype.onBaseTextureLoaded = function () {
            var a = this.baseTexture;
            a.removeEventListener("loaded", this.onLoaded), this.noFrame && (this.frame = new b.Rectangle(0, 0, a.width, a.height)), this.setFrame(this.frame), this.dispatchEvent({
                type: "update",
                content: this
            })
        },b.Texture.prototype.destroy = function (a) {
            a && this.baseTexture.destroy(), this.valid = !1
        },b.Texture.prototype.setFrame = function (a) {
            if (this.noFrame = !1, this.frame = a, this.width = a.width, this.height = a.height, this.crop.x = a.x, this.crop.y = a.y, this.crop.width = a.width, this.crop.height = a.height, !this.trim && (a.x + a.width > this.baseTexture.width || a.y + a.height > this.baseTexture.height)) throw new Error("Texture Error: frame does not fit inside the base Texture dimensions " + this);
            this.valid = a && a.width && a.height && this.baseTexture.source && this.baseTexture.hasLoaded, this.trim && (this.width = this.trim.width, this.height = this.trim.height, this.frame.width = this.trim.width, this.frame.height = this.trim.height), this.valid && this._updateUvs()
        },b.Texture.prototype._updateUvs = function () {
            this._uvs || (this._uvs = new b.TextureUvs);
            var a = this.crop, c = this.baseTexture.width, d = this.baseTexture.height;
            this._uvs.x0 = a.x / c, this._uvs.y0 = a.y / d, this._uvs.x1 = (a.x + a.width) / c, this._uvs.y1 = a.y / d, this._uvs.x2 = (a.x + a.width) / c, this._uvs.y2 = (a.y + a.height) / d, this._uvs.x3 = a.x / c, this._uvs.y3 = (a.y + a.height) / d
        },b.Texture.fromImage = function (a, c, d) {
            var e = b.TextureCache[a];
            return e || (e = new b.Texture(b.BaseTexture.fromImage(a, c, d)), b.TextureCache[a] = e), e
        },b.Texture.fromFrame = function (a) {
            var c = b.TextureCache[a];
            if (!c) throw new Error('The frameId "' + a + '" does not exist in the texture cache ');
            return c
        },b.Texture.fromCanvas = function (a, c) {
            var d = b.BaseTexture.fromCanvas(a, c);
            return new b.Texture(d)
        },b.Texture.addTextureToCache = function (a, c) {
            b.TextureCache[c] = a
        },b.Texture.removeTextureFromCache = function (a) {
            var c = b.TextureCache[a];
            return delete b.TextureCache[a], delete b.BaseTextureCache[a], c
        },b.TextureUvs = function () {
            this.x0 = 0, this.y0 = 0, this.x1 = 0, this.y1 = 0, this.x2 = 0, this.y2 = 0, this.x3 = 0, this.y3 = 0
        },b.Texture.emptyTexture = new b.Texture(new b.BaseTexture),b.RenderTexture = function (a, c, d, e, f) {
            if (this.width = a || 100, this.height = c || 100, this.resolution = f || 1, this.frame = new b.Rectangle(0, 0, this.width * this.resolution, this.height * this.resolution), this.crop = new b.Rectangle(0, 0, this.width * this.resolution, this.height * this.resolution), this.baseTexture = new b.BaseTexture, this.baseTexture.width = this.width * this.resolution, this.baseTexture.height = this.height * this.resolution, this.baseTexture._glTextures = [], this.baseTexture.resolution = this.resolution, this.baseTexture.scaleMode = e || b.scaleModes.DEFAULT, this.baseTexture.hasLoaded = !0, b.Texture.call(this, this.baseTexture, new b.Rectangle(0, 0, this.width, this.height)), this.renderer = d || b.defaultRenderer, this.renderer.type === b.WEBGL_RENDERER) {
                var g = this.renderer.gl;
                this.baseTexture._dirty[g.id] = !1, this.textureBuffer = new b.FilterTexture(g, this.width * this.resolution, this.height * this.resolution, this.baseTexture.scaleMode), this.baseTexture._glTextures[g.id] = this.textureBuffer.texture, this.render = this.renderWebGL, this.projection = new b.Point(.5 * this.width, .5 * -this.height)
            } else this.render = this.renderCanvas, this.textureBuffer = new b.CanvasBuffer(this.width * this.resolution, this.height * this.resolution), this.baseTexture.source = this.textureBuffer.canvas;
            this.valid = !0, this._updateUvs()
        },b.RenderTexture.prototype = Object.create(b.Texture.prototype),b.RenderTexture.prototype.constructor = b.RenderTexture,b.RenderTexture.prototype.resize = function (a, c, d) {
            (a !== this.width || c !== this.height) && (this.valid = a > 0 && c > 0, this.width = this.frame.width = this.crop.width = a, this.height = this.frame.height = this.crop.height = c, d && (this.baseTexture.width = this.width, this.baseTexture.height = this.height), this.renderer.type === b.WEBGL_RENDERER && (this.projection.x = this.width / 2, this.projection.y = -this.height / 2), this.valid && this.textureBuffer.resize(this.width * this.resolution, this.height * this.resolution))
        },b.RenderTexture.prototype.clear = function () {
            this.valid && (this.renderer.type === b.WEBGL_RENDERER && this.renderer.gl.bindFramebuffer(this.renderer.gl.FRAMEBUFFER, this.textureBuffer.frameBuffer), this.textureBuffer.clear())
        },b.RenderTexture.prototype.renderWebGL = function (a, b, c) {
            if (this.valid) {
                var d = a.worldTransform;
                d.identity(), d.translate(0, 2 * this.projection.y), b && d.append(b), d.scale(1, -1), a.worldAlpha = 1;
                for (var e = a.children, f = 0, g = e.length; g > f; f++) e[f].updateTransform();
                var h = this.renderer.gl;
                h.viewport(0, 0, this.width * this.resolution, this.height * this.resolution), h.bindFramebuffer(h.FRAMEBUFFER, this.textureBuffer.frameBuffer), c && this.textureBuffer.clear(), this.renderer.spriteBatch.dirty = !0, this.renderer.renderDisplayObject(a, this.projection, this.textureBuffer.frameBuffer), this.renderer.spriteBatch.dirty = !0
            }
        },b.RenderTexture.prototype.renderCanvas = function (a, b, c) {
            if (this.valid) {
                var d = a.worldTransform;
                d.identity(), b && d.append(b), a.worldAlpha = 1;
                for (var e = a.children, f = 0, g = e.length; g > f; f++) e[f].updateTransform();
                c && this.textureBuffer.clear();
                var h = this.textureBuffer.context, i = this.renderer.resolution;
                this.renderer.resolution = this.resolution, this.renderer.renderDisplayObject(a, h), this.renderer.resolution = i
            }
        },b.RenderTexture.prototype.getImage = function () {
            var a = new Image;
            return a.src = this.getBase64(), a
        },b.RenderTexture.prototype.getBase64 = function () {
            return this.getCanvas().toDataURL()
        },b.RenderTexture.prototype.getCanvas = function () {
            if (this.renderer.type === b.WEBGL_RENDERER) {
                var a = this.renderer.gl, c = this.textureBuffer.width, d = this.textureBuffer.height,
                        e = new Uint8Array(4 * c * d);
                a.bindFramebuffer(a.FRAMEBUFFER, this.textureBuffer.frameBuffer), a.readPixels(0, 0, c, d, a.RGBA, a.UNSIGNED_BYTE, e), a.bindFramebuffer(a.FRAMEBUFFER, null);
                var f = new b.CanvasBuffer(c, d), g = f.context.getImageData(0, 0, c, d);
                return g.data.set(e), f.context.putImageData(g, 0, 0), f.canvas
            }
            return this.textureBuffer.canvas
        },b.RenderTexture.tempMatrix = new b.Matrix,b.VideoTexture = function (a, c) {
            if (!a) throw new Error("No video source element specified.");
            (a.readyState === a.HAVE_ENOUGH_DATA || a.readyState === a.HAVE_FUTURE_DATA) && a.width && a.height && (a.complete = !0), b.BaseTexture.call(this, a, c), this.autoUpdate = !1, this.updateBound = this._onUpdate.bind(this), a.complete || (this._onCanPlay = this.onCanPlay.bind(this), a.addEventListener("canplay", this._onCanPlay), a.addEventListener("canplaythrough", this._onCanPlay), a.addEventListener("play", this.onPlayStart.bind(this)), a.addEventListener("pause", this.onPlayStop.bind(this)))
        },b.VideoTexture.prototype = Object.create(b.BaseTexture.prototype),b.VideoTexture.constructor = b.VideoTexture,b.VideoTexture.prototype._onUpdate = function () {
            this.autoUpdate && (window.requestAnimationFrame(this.updateBound), this.dirty())
        },b.VideoTexture.prototype.onPlayStart = function () {
            this.autoUpdate || (window.requestAnimationFrame(this.updateBound), this.autoUpdate = !0)
        },b.VideoTexture.prototype.onPlayStop = function () {
            this.autoUpdate = !1
        },b.VideoTexture.prototype.onCanPlay = function () {
            "canplaythrough" === event.type && (this.hasLoaded = !0, this.source && (this.source.removeEventListener("canplay", this._onCanPlay), this.source.removeEventListener("canplaythrough", this._onCanPlay), this.width = this.source.videoWidth, this.height = this.source.videoHeight, this.__loaded || (this.__loaded = !0, this.dispatchEvent({
                type: "loaded",
                content: this
            }))))
        },b.VideoTexture.prototype.destroy = function () {
            this.source && this.source._pixiId && (b.BaseTextureCache[this.source._pixiId] = null, delete b.BaseTextureCache[this.source._pixiId], this.source._pixiId = null, delete this.source._pixiId), b.BaseTexture.prototype.destroy.call(this)
        },b.VideoTexture.baseTextureFromVideo = function (a, c) {
            a._pixiId || (a._pixiId = "video_" + b.TextureCacheIdGenerator++);
            var d = b.BaseTextureCache[a._pixiId];
            return d || (d = new b.VideoTexture(a, c), b.BaseTextureCache[a._pixiId] = d), d
        },b.VideoTexture.textureFromVideo = function (a, c) {
            var d = b.VideoTexture.baseTextureFromVideo(a, c);
            return new b.Texture(d)
        },b.VideoTexture.fromUrl = function (a, c) {
            var d = document.createElement("video");
            return d.src = a, d.autoPlay = !0, d.play(), b.VideoTexture.textureFromVideo(d, c)
        },b.AssetLoader = function (a, c) {
            this.assetURLs = a, this.crossorigin = c, this.loadersByType = {
                jpg: b.ImageLoader,
                jpeg: b.ImageLoader,
                png: b.ImageLoader,
                gif: b.ImageLoader,
                webp: b.ImageLoader,
                json: b.JsonLoader,
                atlas: b.AtlasLoader,
                anim: b.SpineLoader,
                xml: b.BitmapFontLoader,
                fnt: b.BitmapFontLoader
            }
        },b.EventTarget.mixin(b.AssetLoader.prototype),b.AssetLoader.prototype.constructor = b.AssetLoader,b.AssetLoader.prototype._getDataType = function (a) {
            var b = "data:", c = a.slice(0, b.length).toLowerCase();
            if (c === b) {
                var d = a.slice(b.length), e = d.indexOf(",");
                if (-1 === e) return null;
                var f = d.slice(0, e).split(";")[0];
                return f && "text/plain" !== f.toLowerCase() ? f.split("/").pop().toLowerCase() : "txt"
            }
            return null
        },b.AssetLoader.prototype.load = function () {
            function a(a) {
                b.onAssetLoaded(a.data.content)
            }

            var b = this;
            this.loadCount = this.assetURLs.length;
            for (var c = 0; c < this.assetURLs.length; c++) {
                var d = this.assetURLs[c], e = this._getDataType(d);
                e || (e = d.split("?").shift().split(".").pop().toLowerCase());
                var f = this.loadersByType[e];
                if (!f) throw new Error(e + " is an unsupported file type");
                var g = new f(d, this.crossorigin);
                g.on("loaded", a), g.load()
            }
        },b.AssetLoader.prototype.onAssetLoaded = function (a) {
            this.loadCount--, this.emit("onProgress", {
                content: this,
                loader: a
            }), this.onProgress && this.onProgress(a), this.loadCount || (this.emit("onComplete", {content: this}), this.onComplete && this.onComplete())
        },b.JsonLoader = function (a, b) {
            this.url = a, this.crossorigin = b, this.baseUrl = a.replace(/[^\/]*$/, ""), this.loaded = !1
        },b.JsonLoader.prototype.constructor = b.JsonLoader,b.EventTarget.mixin(b.JsonLoader.prototype),b.JsonLoader.prototype.load = function () {
            window.XDomainRequest && this.crossorigin ? (this.ajaxRequest = new window.XDomainRequest, this.ajaxRequest.timeout = 3e3, this.ajaxRequest.onerror = this.onError.bind(this), this.ajaxRequest.ontimeout = this.onError.bind(this), this.ajaxRequest.onprogress = function () {
            }, this.ajaxRequest.onload = this.onJSONLoaded.bind(this)) : (this.ajaxRequest = window.XMLHttpRequest ? new window.XMLHttpRequest : new window.ActiveXObject("Microsoft.XMLHTTP"), this.ajaxRequest.onreadystatechange = this.onReadyStateChanged.bind(this)), this.ajaxRequest.open("GET", this.url, !0), this.ajaxRequest.send()
        },b.JsonLoader.prototype.onReadyStateChanged = function () {
            4 !== this.ajaxRequest.readyState || 200 !== this.ajaxRequest.status && -1 !== window.location.href.indexOf("http") || this.onJSONLoaded()
        },b.JsonLoader.prototype.onJSONLoaded = function () {
            if (!this.ajaxRequest.responseText) return void this.onError();
            if (this.json = JSON.parse(this.ajaxRequest.responseText), this.json.frames && this.json.meta && this.json.meta.image) {
                var a = this.baseUrl + this.json.meta.image, d = new b.ImageLoader(a, this.crossorigin),
                        e = this.json.frames;
                this.texture = d.texture.baseTexture, d.addEventListener("loaded", this.onLoaded.bind(this));
                for (var f in e) {
                    var g = e[f].frame;
                    if (g) {
                        var h = new b.Rectangle(g.x, g.y, g.w, g.h), i = h.clone(), j = null;
                        if (e[f].trimmed) {
                            var k = e[f].sourceSize, l = e[f].spriteSourceSize;
                            j = new b.Rectangle(l.x, l.y, k.w, k.h)
                        }
                        b.TextureCache[f] = new b.Texture(this.texture, h, i, j)
                    }
                }
                d.load()
            } else if (this.json.bones) if (b.AnimCache[this.url]) this.onLoaded(); else {
                var m = this.url.substr(0, this.url.lastIndexOf(".")) + ".atlas",
                        n = new b.JsonLoader(m, this.crossorigin), o = this;
                n.onJSONLoaded = function () {
                    if (!this.ajaxRequest.responseText) return void this.onError();
                    var a = new b.SpineTextureLoader(this.url.substring(0, this.url.lastIndexOf("/"))),
                            d = new c.Atlas(this.ajaxRequest.responseText, a), e = new c.AtlasAttachmentLoader(d),
                            f = new c.SkeletonJson(e), g = f.readSkeletonData(o.json);
                    b.AnimCache[o.url] = g, o.spine = g, o.spineAtlas = d, o.spineAtlasLoader = n, a.loadingCount > 0 ? a.addEventListener("loadedBaseTexture", function (a) {
                        a.content.content.loadingCount <= 0 && o.onLoaded()
                    }) : o.onLoaded()
                }, n.load()
            } else this.onLoaded()
        },b.JsonLoader.prototype.onLoaded = function () {
            this.loaded = !0, this.dispatchEvent({type: "loaded", content: this})
        },b.JsonLoader.prototype.onError = function () {
            this.dispatchEvent({type: "error", content: this})
        },b.AtlasLoader = function (a, b) {
            this.url = a, this.baseUrl = a.replace(/[^\/]*$/, ""), this.crossorigin = b, this.loaded = !1
        },b.AtlasLoader.constructor = b.AtlasLoader,b.EventTarget.mixin(b.AtlasLoader.prototype),b.AtlasLoader.prototype.load = function () {
            this.ajaxRequest = new b.AjaxRequest, this.ajaxRequest.onreadystatechange = this.onAtlasLoaded.bind(this), this.ajaxRequest.open("GET", this.url, !0), this.ajaxRequest.overrideMimeType && this.ajaxRequest.overrideMimeType("application/json"), this.ajaxRequest.send(null)
        },b.AtlasLoader.prototype.onAtlasLoaded = function () {
            if (4 === this.ajaxRequest.readyState) if (200 === this.ajaxRequest.status || -1 === window.location.href.indexOf("http")) {
                this.atlas = {meta: {image: []}, frames: []};
                var a = this.ajaxRequest.responseText.split(/\r?\n/), c = -3, d = 0, e = null, f = !1, g = 0, h = 0,
                        i = this.onLoaded.bind(this);
                for (g = 0; g < a.length; g++) if (a[g] = a[g].replace(/^\s+|\s+$/g, ""), "" === a[g] && (f = g + 1), a[g].length > 0) {
                    if (f === g) this.atlas.meta.image.push(a[g]), d = this.atlas.meta.image.length - 1, this.atlas.frames.push({}), c = -3;
                    else if (c > 0) if (c % 7 === 1) null != e && (this.atlas.frames[d][e.name] = e), e = {
                        name: a[g],
                        frame: {}
                    }; else {
                        var j = a[g].split(" ");
                        if (c % 7 === 3) e.frame.x = Number(j[1].replace(",", "")), e.frame.y = Number(j[2]); else if (c % 7 === 4) e.frame.w = Number(j[1].replace(",", "")), e.frame.h = Number(j[2]); else if (c % 7 === 5) {
                            var k = {x: 0, y: 0, w: Number(j[1].replace(",", "")), h: Number(j[2])};
                            k.w > e.frame.w || k.h > e.frame.h ? (e.trimmed = !0, e.realSize = k) : e.trimmed = !1
                        }
                    }
                    c++
                }
                if (null != e && (this.atlas.frames[d][e.name] = e), this.atlas.meta.image.length > 0) {
                    for (this.images = [], h = 0; h < this.atlas.meta.image.length; h++) {
                        var l = this.baseUrl + this.atlas.meta.image[h], m = this.atlas.frames[h];
                        this.images.push(new b.ImageLoader(l, this.crossorigin));
                        for (g in m) {
                            var n = m[g].frame;
                            n && (b.TextureCache[g] = new b.Texture(this.images[h].texture.baseTexture, {
                                x: n.x,
                                y: n.y,
                                width: n.w,
                                height: n.h
                            }), m[g].trimmed && (b.TextureCache[g].realSize = m[g].realSize, b.TextureCache[g].trim.x = 0, b.TextureCache[g].trim.y = 0))
                        }
                    }
                    for (this.currentImageId = 0, h = 0; h < this.images.length; h++) this.images[h].on("loaded", i);
                    this.images[this.currentImageId].load()
                } else this.onLoaded()
            } else this.onError()
        },b.AtlasLoader.prototype.onLoaded = function () {
            this.images.length - 1 > this.currentImageId ? (this.currentImageId++, this.images[this.currentImageId].load()) : (this.loaded = !0, this.emit("loaded", {content: this}))
        },b.AtlasLoader.prototype.onError = function () {
            this.emit("error", {content: this})
        },b.SpriteSheetLoader = function (a, b) {
            this.url = a, this.crossorigin = b, this.baseUrl = a.replace(/[^\/]*$/, ""), this.texture = null, this.frames = {}
        },b.SpriteSheetLoader.prototype.constructor = b.SpriteSheetLoader,b.EventTarget.mixin(b.SpriteSheetLoader.prototype),b.SpriteSheetLoader.prototype.load = function () {
            var a = this, c = new b.JsonLoader(this.url, this.crossorigin);
            c.on("loaded", function (b) {
                a.json = b.data.content.json, a.onLoaded()
            }), c.load()
        },b.SpriteSheetLoader.prototype.onLoaded = function () {
            this.emit("loaded", {content: this})
        },b.ImageLoader = function (a, c) {
            this.texture = b.Texture.fromImage(a, c), this.frames = []
        },b.ImageLoader.prototype.constructor = b.ImageLoader,b.EventTarget.mixin(b.ImageLoader.prototype),b.ImageLoader.prototype.load = function () {
            this.texture.baseTexture.hasLoaded ? this.onLoaded() : this.texture.baseTexture.on("loaded", this.onLoaded.bind(this))
        },b.ImageLoader.prototype.onLoaded = function () {
            this.emit("loaded", {content: this})
        },b.ImageLoader.prototype.loadFramedSpriteSheet = function (a, c, d) {
            this.frames = [];
            for (var e = Math.floor(this.texture.width / a), f = Math.floor(this.texture.height / c), g = 0, h = 0; f > h; h++) for (var i = 0; e > i; i++, g++) {
                var j = new b.Texture(this.texture.baseTexture, {x: i * a, y: h * c, width: a, height: c});
                this.frames.push(j), d && (b.TextureCache[d + "-" + g] = j)
            }
            this.load()
        },b.BitmapFontLoader = function (a, b) {
            this.url = a, this.crossorigin = b, this.baseUrl = a.replace(/[^\/]*$/, ""), this.texture = null
        },b.BitmapFontLoader.prototype.constructor = b.BitmapFontLoader,b.EventTarget.mixin(b.BitmapFontLoader.prototype),b.BitmapFontLoader.prototype.load = function () {
            this.ajaxRequest = new b.AjaxRequest, this.ajaxRequest.onreadystatechange = this.onXMLLoaded.bind(this), this.ajaxRequest.open("GET", this.url, !0), this.ajaxRequest.overrideMimeType && this.ajaxRequest.overrideMimeType("application/xml"), this.ajaxRequest.send(null)
        },b.BitmapFontLoader.prototype.onXMLLoaded = function () {
            if (4 === this.ajaxRequest.readyState && (200 === this.ajaxRequest.status || -1 === window.location.protocol.indexOf("http"))) {
                var a = this.ajaxRequest.responseXML;
                if (!a || /MSIE 9/i.test(navigator.userAgent) || navigator.isCocoonJS) if ("function" == typeof window.DOMParser) {
                    var c = new DOMParser;
                    a = c.parseFromString(this.ajaxRequest.responseText, "text/xml")
                } else {
                    var d = document.createElement("div");
                    d.innerHTML = this.ajaxRequest.responseText, a = d
                }
                var e = this.baseUrl + a.getElementsByTagName("page")[0].getAttribute("file"),
                        f = new b.ImageLoader(e, this.crossorigin);
                this.texture = f.texture.baseTexture;
                var g = {}, h = a.getElementsByTagName("info")[0], i = a.getElementsByTagName("common")[0];
                g.font = h.getAttribute("face"), g.size = parseInt(h.getAttribute("size"), 10), g.lineHeight = parseInt(i.getAttribute("lineHeight"), 10), g.chars = {};
                for (var j = a.getElementsByTagName("char"), k = 0; k < j.length; k++) {
                    var l = parseInt(j[k].getAttribute("id"), 10),
                            m = new b.Rectangle(parseInt(j[k].getAttribute("x"), 10), parseInt(j[k].getAttribute("y"), 10), parseInt(j[k].getAttribute("width"), 10), parseInt(j[k].getAttribute("height"), 10));
                    g.chars[l] = {
                        xOffset: parseInt(j[k].getAttribute("xoffset"), 10),
                        yOffset: parseInt(j[k].getAttribute("yoffset"), 10),
                        xAdvance: parseInt(j[k].getAttribute("xadvance"), 10),
                        kerning: {},
                        texture: b.TextureCache[l] = new b.Texture(this.texture, m)
                    }
                }
                var n = a.getElementsByTagName("kerning");
                for (k = 0; k < n.length; k++) {
                    var o = parseInt(n[k].getAttribute("first"), 10), p = parseInt(n[k].getAttribute("second"), 10),
                            q = parseInt(n[k].getAttribute("amount"), 10);
                    g.chars[p].kerning[o] = q
                }
                b.BitmapText.fonts[g.font] = g, f.addEventListener("loaded", this.onLoaded.bind(this)), f.load()
            }
        },b.BitmapFontLoader.prototype.onLoaded = function () {
            this.emit("loaded", {content: this})
        },b.SpineLoader = function (a, b) {
            this.url = a, this.crossorigin = b, this.loaded = !1
        },b.SpineLoader.prototype.constructor = b.SpineLoader,b.EventTarget.mixin(b.SpineLoader.prototype),b.SpineLoader.prototype.load = function () {
            var a = this, c = new b.JsonLoader(this.url, this.crossorigin);
            c.on("loaded", function (b) {
                a.json = b.data.content.json, a.onLoaded()
            }), c.load()
        },b.SpineLoader.prototype.onLoaded = function () {
            this.loaded = !0, this.emit("loaded", {content: this})
        },b.AbstractFilter = function (a, b) {
            this.passes = [this], this.shaders = [], this.dirty = !0, this.padding = 0, this.uniforms = b || {}, this.fragmentSrc = a || []
        },b.AbstractFilter.prototype.constructor = b.AbstractFilter,b.AbstractFilter.prototype.syncUniforms = function () {
            for (var a = 0, b = this.shaders.length; b > a; a++) this.shaders[a].dirty = !0
        },b.AlphaMaskFilter = function (a) {
            b.AbstractFilter.call(this), this.passes = [this], a.baseTexture._powerOf2 = !0, this.uniforms = {
                mask: {
                    type: "sampler2D",
                    value: a
                }, mapDimensions: {type: "2f", value: {x: 1, y: 5112}}, dimensions: {type: "4fv", value: [0, 0, 0, 0]}
            }, a.baseTexture.hasLoaded ? (this.uniforms.mask.value.x = a.width, this.uniforms.mask.value.y = a.height) : (this.boundLoadedFunction = this.onTextureLoaded.bind(this), a.baseTexture.on("loaded", this.boundLoadedFunction)), this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform sampler2D mask;", "uniform sampler2D uSampler;", "uniform vec2 offset;", "uniform vec4 dimensions;", "uniform vec2 mapDimensions;", "void main(void) {", "   vec2 mapCords = vTextureCoord.xy;", "   mapCords += (dimensions.zw + offset)/ dimensions.xy ;", "   mapCords.y *= -1.0;", "   mapCords.y += 1.0;", "   mapCords *= dimensions.xy / mapDimensions;", "   vec4 original =  texture2D(uSampler, vTextureCoord);", "   float maskAlpha =  texture2D(mask, mapCords).r;", "   original *= maskAlpha;", "   gl_FragColor =  original;", "}"]
        },b.AlphaMaskFilter.prototype = Object.create(b.AbstractFilter.prototype),b.AlphaMaskFilter.prototype.constructor = b.AlphaMaskFilter,b.AlphaMaskFilter.prototype.onTextureLoaded = function () {
            this.uniforms.mapDimensions.value.x = this.uniforms.mask.value.width, this.uniforms.mapDimensions.value.y = this.uniforms.mask.value.height, this.uniforms.mask.value.baseTexture.off("loaded", this.boundLoadedFunction)
        },Object.defineProperty(b.AlphaMaskFilter.prototype, "map", {
            get: function () {
                return this.uniforms.mask.value
            }, set: function (a) {
                this.uniforms.mask.value = a
            }
        }),b.ColorMatrixFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                matrix: {
                    type: "mat4",
                    value: [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]
                }
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform float invert;", "uniform mat4 matrix;", "uniform sampler2D uSampler;", "void main(void) {", "   gl_FragColor = texture2D(uSampler, vTextureCoord) * matrix;", "}"]
        },b.ColorMatrixFilter.prototype = Object.create(b.AbstractFilter.prototype),b.ColorMatrixFilter.prototype.constructor = b.ColorMatrixFilter,Object.defineProperty(b.ColorMatrixFilter.prototype, "matrix", {
            get: function () {
                return this.uniforms.matrix.value
            }, set: function (a) {
                this.uniforms.matrix.value = a
            }
        }),b.GrayFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                gray: {
                    type: "1f",
                    value: 1
                }
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform sampler2D uSampler;", "uniform float gray;", "void main(void) {", "   gl_FragColor = texture2D(uSampler, vTextureCoord);", "   gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(0.2126*gl_FragColor.r + 0.7152*gl_FragColor.g + 0.0722*gl_FragColor.b), gray);", "}"]
        },b.GrayFilter.prototype = Object.create(b.AbstractFilter.prototype),b.GrayFilter.prototype.constructor = b.GrayFilter,Object.defineProperty(b.GrayFilter.prototype, "gray", {
            get: function () {
                return this.uniforms.gray.value
            }, set: function (a) {
                this.uniforms.gray.value = a
            }
        }),b.DisplacementFilter = function (a) {
            b.AbstractFilter.call(this), this.passes = [this], a.baseTexture._powerOf2 = !0, this.uniforms = {
                displacementMap: {
                    type: "sampler2D",
                    value: a
                },
                scale: {type: "2f", value: {x: 30, y: 30}},
                offset: {type: "2f", value: {x: 0, y: 0}},
                mapDimensions: {type: "2f", value: {x: 1, y: 5112}},
                dimensions: {type: "4fv", value: [0, 0, 0, 0]}
            }, a.baseTexture.hasLoaded ? (this.uniforms.mapDimensions.value.x = a.width, this.uniforms.mapDimensions.value.y = a.height) : (this.boundLoadedFunction = this.onTextureLoaded.bind(this), a.baseTexture.on("loaded", this.boundLoadedFunction)), this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform sampler2D displacementMap;", "uniform sampler2D uSampler;", "uniform vec2 scale;", "uniform vec2 offset;", "uniform vec4 dimensions;", "uniform vec2 mapDimensions;", "void main(void) {", "   vec2 mapCords = vTextureCoord.xy;", "   mapCords += (dimensions.zw + offset)/ dimensions.xy ;", "   mapCords.y *= -1.0;", "   mapCords.y += 1.0;", "   vec2 matSample = texture2D(displacementMap, mapCords).xy;", "   matSample -= 0.5;", "   matSample *= scale;", "   matSample /= mapDimensions;", "   gl_FragColor = texture2D(uSampler, vec2(vTextureCoord.x + matSample.x, vTextureCoord.y + matSample.y));", "   gl_FragColor.rgb = mix( gl_FragColor.rgb, gl_FragColor.rgb, 1.0);", "   vec2 cord = vTextureCoord;", "}"]
        },b.DisplacementFilter.prototype = Object.create(b.AbstractFilter.prototype),b.DisplacementFilter.prototype.constructor = b.DisplacementFilter,b.DisplacementFilter.prototype.onTextureLoaded = function () {
            this.uniforms.mapDimensions.value.x = this.uniforms.displacementMap.value.width, this.uniforms.mapDimensions.value.y = this.uniforms.displacementMap.value.height, this.uniforms.displacementMap.value.baseTexture.off("loaded", this.boundLoadedFunction)
        },Object.defineProperty(b.DisplacementFilter.prototype, "map", {
            get: function () {
                return this.uniforms.displacementMap.value
            }, set: function (a) {
                this.uniforms.displacementMap.value = a
            }
        }),Object.defineProperty(b.DisplacementFilter.prototype, "scale", {
            get: function () {
                return this.uniforms.scale.value
            }, set: function (a) {
                this.uniforms.scale.value = a
            }
        }),Object.defineProperty(b.DisplacementFilter.prototype, "offset", {
            get: function () {
                return this.uniforms.offset.value
            }, set: function (a) {
                this.uniforms.offset.value = a
            }
        }),b.PixelateFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                invert: {type: "1f", value: 0},
                dimensions: {type: "4fv", value: new b.Float32Array([1e4, 100, 10, 10])},
                pixelSize: {type: "2f", value: {x: 10, y: 10}}
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform vec2 testDim;", "uniform vec4 dimensions;", "uniform vec2 pixelSize;", "uniform sampler2D uSampler;", "void main(void) {", "   vec2 coord = vTextureCoord;", "   vec2 size = dimensions.xy/pixelSize;", "   vec2 color = floor( ( vTextureCoord * size ) ) / size + pixelSize/dimensions.xy * 0.5;", "   gl_FragColor = texture2D(uSampler, color);", "}"]
        },b.PixelateFilter.prototype = Object.create(b.AbstractFilter.prototype),b.PixelateFilter.prototype.constructor = b.PixelateFilter,Object.defineProperty(b.PixelateFilter.prototype, "size", {
            get: function () {
                return this.uniforms.pixelSize.value
            }, set: function (a) {
                this.dirty = !0, this.uniforms.pixelSize.value = a
            }
        }),b.BlurXFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                blur: {
                    type: "1f",
                    value: 1 / 512
                }
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform float blur;", "uniform sampler2D uSampler;", "void main(void) {", "   vec4 sum = vec4(0.0);", "   sum += texture2D(uSampler, vec2(vTextureCoord.x - 4.0*blur, vTextureCoord.y)) * 0.05;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x - 3.0*blur, vTextureCoord.y)) * 0.09;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x - 2.0*blur, vTextureCoord.y)) * 0.12;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x - blur, vTextureCoord.y)) * 0.15;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y)) * 0.16;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x + blur, vTextureCoord.y)) * 0.15;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x + 2.0*blur, vTextureCoord.y)) * 0.12;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x + 3.0*blur, vTextureCoord.y)) * 0.09;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x + 4.0*blur, vTextureCoord.y)) * 0.05;", "   gl_FragColor = sum;", "}"]
        },b.BlurXFilter.prototype = Object.create(b.AbstractFilter.prototype),b.BlurXFilter.prototype.constructor = b.BlurXFilter,Object.defineProperty(b.BlurXFilter.prototype, "blur", {
            get: function () {
                return this.uniforms.blur.value / (1 / 7e3)
            }, set: function (a) {
                this.dirty = !0, this.uniforms.blur.value = 1 / 7e3 * a
            }
        }),b.BlurYFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                blur: {
                    type: "1f",
                    value: 1 / 512
                }
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform float blur;", "uniform sampler2D uSampler;", "void main(void) {", "   vec4 sum = vec4(0.0);", "   sum += texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y - 4.0*blur)) * 0.05;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y - 3.0*blur)) * 0.09;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y - 2.0*blur)) * 0.12;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y - blur)) * 0.15;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y)) * 0.16;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y + blur)) * 0.15;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y + 2.0*blur)) * 0.12;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y + 3.0*blur)) * 0.09;", "   sum += texture2D(uSampler, vec2(vTextureCoord.x, vTextureCoord.y + 4.0*blur)) * 0.05;", "   gl_FragColor = sum;", "}"]
        },b.BlurYFilter.prototype = Object.create(b.AbstractFilter.prototype),b.BlurYFilter.prototype.constructor = b.BlurYFilter,Object.defineProperty(b.BlurYFilter.prototype, "blur", {
            get: function () {
                return this.uniforms.blur.value / (1 / 7e3)
            }, set: function (a) {
                this.uniforms.blur.value = 1 / 7e3 * a
            }
        }),b.BlurFilter = function () {
            this.blurXFilter = new b.BlurXFilter, this.blurYFilter = new b.BlurYFilter, this.passes = [this.blurXFilter, this.blurYFilter]
        },b.BlurFilter.prototype = Object.create(b.AbstractFilter.prototype),b.BlurFilter.prototype.constructor = b.BlurFilter,Object.defineProperty(b.BlurFilter.prototype, "blur", {
            get: function () {
                return this.blurXFilter.blur
            }, set: function (a) {
                this.blurXFilter.blur = this.blurYFilter.blur = a
            }
        }),Object.defineProperty(b.BlurFilter.prototype, "blurX", {
            get: function () {
                return this.blurXFilter.blur
            }, set: function (a) {
                this.blurXFilter.blur = a
            }
        }),Object.defineProperty(b.BlurFilter.prototype, "blurY", {
            get: function () {
                return this.blurYFilter.blur
            }, set: function (a) {
                this.blurYFilter.blur = a
            }
        }),b.InvertFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                invert: {
                    type: "1f",
                    value: 1
                }
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform float invert;", "uniform sampler2D uSampler;", "void main(void) {", "   gl_FragColor = texture2D(uSampler, vTextureCoord);", "   gl_FragColor.rgb = mix( (vec3(1)-gl_FragColor.rgb) * gl_FragColor.a, gl_FragColor.rgb, 1.0 - invert);", "}"]
        },b.InvertFilter.prototype = Object.create(b.AbstractFilter.prototype),b.InvertFilter.prototype.constructor = b.InvertFilter,Object.defineProperty(b.InvertFilter.prototype, "invert", {
            get: function () {
                return this.uniforms.invert.value
            }, set: function (a) {
                this.uniforms.invert.value = a
            }
        }),b.SepiaFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                sepia: {
                    type: "1f",
                    value: 1
                }
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform float sepia;", "uniform sampler2D uSampler;", "const mat3 sepiaMatrix = mat3(0.3588, 0.7044, 0.1368, 0.2990, 0.5870, 0.1140, 0.2392, 0.4696, 0.0912);", "void main(void) {", "   gl_FragColor = texture2D(uSampler, vTextureCoord);", "   gl_FragColor.rgb = mix( gl_FragColor.rgb, gl_FragColor.rgb * sepiaMatrix, sepia);", "}"]
        },b.SepiaFilter.prototype = Object.create(b.AbstractFilter.prototype),b.SepiaFilter.prototype.constructor = b.SepiaFilter,Object.defineProperty(b.SepiaFilter.prototype, "sepia", {
            get: function () {
                return this.uniforms.sepia.value
            }, set: function (a) {
                this.uniforms.sepia.value = a
            }
        }),b.TwistFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                radius: {type: "1f", value: .5},
                angle: {type: "1f", value: 5},
                offset: {type: "2f", value: {x: .5, y: .5}}
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform vec4 dimensions;", "uniform sampler2D uSampler;", "uniform float radius;", "uniform float angle;", "uniform vec2 offset;", "void main(void) {", "   vec2 coord = vTextureCoord - offset;", "   float distance = length(coord);", "   if (distance < radius) {", "       float ratio = (radius - distance) / radius;", "       float angleMod = ratio * ratio * angle;", "       float s = sin(angleMod);", "       float c = cos(angleMod);", "       coord = vec2(coord.x * c - coord.y * s, coord.x * s + coord.y * c);", "   }", "   gl_FragColor = texture2D(uSampler, coord+offset);", "}"]
        },b.TwistFilter.prototype = Object.create(b.AbstractFilter.prototype),b.TwistFilter.prototype.constructor = b.TwistFilter,Object.defineProperty(b.TwistFilter.prototype, "offset", {
            get: function () {
                return this.uniforms.offset.value
            }, set: function (a) {
                this.dirty = !0, this.uniforms.offset.value = a
            }
        }),Object.defineProperty(b.TwistFilter.prototype, "radius", {
            get: function () {
                return this.uniforms.radius.value
            }, set: function (a) {
                this.dirty = !0, this.uniforms.radius.value = a
            }
        }),Object.defineProperty(b.TwistFilter.prototype, "angle", {
            get: function () {
                return this.uniforms.angle.value
            }, set: function (a) {
                this.dirty = !0, this.uniforms.angle.value = a
            }
        }),b.ColorStepFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                step: {
                    type: "1f",
                    value: 5
                }
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform sampler2D uSampler;", "uniform float step;", "void main(void) {", "   vec4 color = texture2D(uSampler, vTextureCoord);", "   color = floor(color * step) / step;", "   gl_FragColor = color;", "}"]
        },b.ColorStepFilter.prototype = Object.create(b.AbstractFilter.prototype),b.ColorStepFilter.prototype.constructor = b.ColorStepFilter,Object.defineProperty(b.ColorStepFilter.prototype, "step", {
            get: function () {
                return this.uniforms.step.value
            }, set: function (a) {
                this.uniforms.step.value = a
            }
        }),b.DotScreenFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                scale: {type: "1f", value: 1},
                angle: {type: "1f", value: 5},
                dimensions: {type: "4fv", value: [0, 0, 0, 0]}
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform vec4 dimensions;", "uniform sampler2D uSampler;", "uniform float angle;", "uniform float scale;", "float pattern() {", "   float s = sin(angle), c = cos(angle);", "   vec2 tex = vTextureCoord * dimensions.xy;", "   vec2 point = vec2(", "       c * tex.x - s * tex.y,", "       s * tex.x + c * tex.y", "   ) * scale;", "   return (sin(point.x) * sin(point.y)) * 4.0;", "}", "void main() {", "   vec4 color = texture2D(uSampler, vTextureCoord);", "   float average = (color.r + color.g + color.b) / 3.0;", "   gl_FragColor = vec4(vec3(average * 10.0 - 5.0 + pattern()), color.a);", "}"]
        },b.DotScreenFilter.prototype = Object.create(b.AbstractFilter.prototype),b.DotScreenFilter.prototype.constructor = b.DotScreenFilter,Object.defineProperty(b.DotScreenFilter.prototype, "scale", {
            get: function () {
                return this.uniforms.scale.value
            }, set: function (a) {
                this.dirty = !0, this.uniforms.scale.value = a
            }
        }),Object.defineProperty(b.DotScreenFilter.prototype, "angle", {
            get: function () {
                return this.uniforms.angle.value
            }, set: function (a) {
                this.dirty = !0, this.uniforms.angle.value = a
            }
        }),b.CrossHatchFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                blur: {
                    type: "1f",
                    value: 1 / 512
                }
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform float blur;", "uniform sampler2D uSampler;", "void main(void) {", "    float lum = length(texture2D(uSampler, vTextureCoord.xy).rgb);", "    gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);", "    if (lum < 1.00) {", "        if (mod(gl_FragCoord.x + gl_FragCoord.y, 10.0) == 0.0) {", "            gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);", "        }", "    }", "    if (lum < 0.75) {", "        if (mod(gl_FragCoord.x - gl_FragCoord.y, 10.0) == 0.0) {", "            gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);", "        }", "    }", "    if (lum < 0.50) {", "        if (mod(gl_FragCoord.x + gl_FragCoord.y - 5.0, 10.0) == 0.0) {", "            gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);", "        }", "    }", "    if (lum < 0.3) {", "        if (mod(gl_FragCoord.x - gl_FragCoord.y - 5.0, 10.0) == 0.0) {", "            gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);", "        }", "    }", "}"]
        },b.CrossHatchFilter.prototype = Object.create(b.AbstractFilter.prototype),b.CrossHatchFilter.prototype.constructor = b.CrossHatchFilter,Object.defineProperty(b.CrossHatchFilter.prototype, "blur", {
            get: function () {
                return this.uniforms.blur.value / (1 / 7e3)
            }, set: function (a) {
                this.uniforms.blur.value = 1 / 7e3 * a
            }
        }),b.RGBSplitFilter = function () {
            b.AbstractFilter.call(this), this.passes = [this], this.uniforms = {
                red: {
                    type: "2f",
                    value: {x: 20, y: 20}
                },
                green: {type: "2f", value: {x: -20, y: 20}},
                blue: {type: "2f", value: {x: 20, y: -20}},
                dimensions: {type: "4fv", value: [0, 0, 0, 0]}
            }, this.fragmentSrc = ["precision mediump float;", "varying vec2 vTextureCoord;", "varying vec4 vColor;", "uniform vec2 red;", "uniform vec2 green;", "uniform vec2 blue;", "uniform vec4 dimensions;", "uniform sampler2D uSampler;", "void main(void) {", "   gl_FragColor.r = texture2D(uSampler, vTextureCoord + red/dimensions.xy).r;", "   gl_FragColor.g = texture2D(uSampler, vTextureCoord + green/dimensions.xy).g;", "   gl_FragColor.b = texture2D(uSampler, vTextureCoord + blue/dimensions.xy).b;", "   gl_FragColor.a = texture2D(uSampler, vTextureCoord).a;", "}"]
        },b.RGBSplitFilter.prototype = Object.create(b.AbstractFilter.prototype),b.RGBSplitFilter.prototype.constructor = b.RGBSplitFilter,Object.defineProperty(b.RGBSplitFilter.prototype, "red", {
            get: function () {
                return this.uniforms.red.value
            }, set: function (a) {
                this.uniforms.red.value = a
            }
        }),Object.defineProperty(b.RGBSplitFilter.prototype, "green", {
            get: function () {
                return this.uniforms.green.value
            }, set: function (a) {
                this.uniforms.green.value = a
            }
        }),Object.defineProperty(b.RGBSplitFilter.prototype, "blue", {
            get: function () {
                return this.uniforms.blue.value
            }, set: function (a) {
                this.uniforms.blue.value = a
            }
        }),"undefined" != typeof exports ? ("undefined" != typeof module && module.exports && (exports = module.exports = b), exports.PIXI = b) : "undefined" != typeof define && define.amd ? define(b) : a.PIXI = b
    }).call(this);

</script>


<script>//animation frame polyfill
(function () {
    var lastTime = 0;
    var vendors = ['ms', 'moz', 'webkit', 'o'];
    for (var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
        window.requestAnimationFrame = window[vendors[x] + 'RequestAnimationFrame'];
        window.cancelAnimationFrame = window[vendors[x] + 'CancelAnimationFrame'] || window[vendors[x] + 'CancelRequestAnimationFrame'];
    }

    if (!window.requestAnimationFrame)
        window.requestAnimationFrame = function (callback, element) {
            var currTime = new Date().getTime();
            var timeToCall = Math.max(0, 16 - (currTime - lastTime));
            var id = window.setTimeout(function () {
                        callback(currTime + timeToCall);
                    },
                    timeToCall);
            lastTime = currTime + timeToCall;
            return id;
        };

    if (!window.cancelAnimationFrame)
        window.cancelAnimationFrame = function (id) {
            clearTimeout(id);
        };
}());

//math2 utils
var Math2 = {};
Math2.random = function (t, n) {
    return Math.random() * (n - t) + t
}, Math2.map = function (t, n, r, a, o) {
    return (o - a) * ((t - n) / (r - n)) + a
}, Math2.randomPlusMinus = function (t) {
    return t = t ? t : .5, Math.random() > t ? -1 : 1
}, Math2.randomInt = function (t, n) {
    return n += 1, Math.floor(Math.random() * (n - t) + t)
}, Math2.randomBool = function (t) {
    return t = t ? t : .5, Math.random() < t ? !0 : !1
}, Math2.degToRad = function (t) {
    return rad = t * Math.PI / 180, rad
}, Math2.radToDeg = function (t) {
    return deg = 180 / (Math.PI * t), deg
}, Math2.rgbToHex = function (t) {
    function n(t) {
        return ("0" + parseInt(t).toString(16)).slice(-2)
    }

    t = t.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    var r = n(t[1]) + n(t[2]) + n(t[3]);
    return r.toUpperCase()
}, Math2.distance = function (t, n, r, a) {
    return Math.sqrt((r - t) * (r - t) + (a - n) * (a - n))
};

//mouse
var mousePos = {
    x: 0,
    y: 0
};
window.onmousemove = function (e) {

    e = e || window.event;

    var pageX = e.pageX;
    var pageY = e.pageY;
    if (pageX === undefined) {
        pageX = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
        pageY = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
    }
    mousePos = {
        x: pageX,
        y: pageY,
    };
}


var options = {
    width: window.innerWidth,
    height: window.innerHeight,
    keyword: "404",
    density: 10,
    densityText: 3,
    minDist: 20,
}
// initialize canvas
var canvas = document.createElement('canvas');
canvas.width = options.width;
canvas.height = options.height;
canvas.style.width = options.width / 2;
canvas.style.height = options.height / 2;
canvas.getContext('2d').scale(2, 2)

var renderer = new PIXI.autoDetectRenderer(options.width, options.height, {
    transparent: true
});
var stage = new PIXI.Stage("0X000000", true);
document.body.appendChild(renderer.view);
renderer.view.id = "notFound";


var imageData = false;
var particles = [];


function init() {
    positionParticles();
    positionText();
}

function positionParticles() {

    var canvas = document.createElement("canvas");
    canvas.width = 500;
    canvas.height = 350;
    var context = canvas.getContext("2d");
    context.fillStyle = "#000000";
    context.font = "300px 'Arial', sans-serif";
    context.fillText(options.keyword, 0, 250);

    var imageData = context.getImageData(0, 0, 350, 500);
    data = imageData.data;

    // Iterate each row and column
    for (var i = 0; i < imageData.height; i += options.density) {
        for (var j = 0; j < imageData.width; j += options.density) {

            // Get the color of the pixel
            var color = data[((j * (imageData.width * 4)) + (i * 4)) - 1];

            // If the color is black, draw pixels
            if (color == 255) {
                var newPar = particle()
                newPar.setPosition(i, j);
                particles.push(newPar);
                stage.addChild(newPar)
            }
        }
    }
}

function positionText() {
    var canvas = document.createElement("canvas");
    canvas.width = 400;
    canvas.height = 120;
    var context = canvas.getContext("2d");
    context.fillStyle = "#000000";
    context.font = "80px 'Arial', sans-serif";
    context.fillText("Not Found", 0, 80);

    var imageData = context.getImageData(0, 0, 400, 400);
    data = imageData.data;

    // Iterate each row and column
    for (var i = 0; i < imageData.height; i += options.densityText) {
        for (var j = 0; j < imageData.width; j += options.densityText) {

            // Get the color of the pixel
            var color = data[((j * (imageData.width * 4)) + (i * 4)) - 1];

            // If the color is black, draw pixels
            if (color == 255) {
                var newPar = particle(true)
                newPar.setPosition(i, j);
                particles.push(newPar);
                stage.addChild(newPar)
            }
        }
    }
}

function particle(text) {

    $this = new PIXI.Graphics()

    if (text == true) {
        $this.text = true;
    }

    $this.beginFill(0XFFFFFF);

    var radius;
    $this.radius = radius = $this.text ? Math.random() * 3.5 : Math.random() * 10.5;

    $this.drawCircle(0, 0, radius);

    $this.size = this.radius;
    $this.x = -this.width;
    $this.y = -this.height;
    $this.free = false;

    $this.timer = Math2.randomInt(0, 100);
    $this.v = Math2.randomPlusMinus() * Math2.random(.5, 1);
    $this.hovered = false

    $this.alpha = Math2.randomInt(10, 100) / 100;

    $this.vy = -5 + parseInt(Math.random() * 10) / 2;
    $this.vx = -4 + parseInt(Math.random() * 8);

    $this.setPosition = function (x, y) {
        if ($this.text) {
            $this.x = x + (options.width / 2 - 180);
            $this.y = y + (options.height / 2 + 100);
        } else {
            $this.x = x + (options.width / 2 - 250);
            $this.y = y + (options.height / 2 - 175);
        }
    };

    return $this;

}


function update() {

    renderer.render(stage);


    for (i = 0; i < particles.length; i++) {
        var p = particles[i];

        if (mousePos.x > p.x && mousePos.x < p.x + p.size && mousePos.y > p.y && mousePos.y < p.y + p.size) {
            p.hovered = true;
        }

        p.scale.x = p.scale.y = scale = Math.max(Math.min(2.5 - (Math2.distance(p.x, p.y, mousePos.x, mousePos.y) / 160), 160), 1);


        p.x = p.x + .2 * Math.sin(p.timer * .15)
        p.y = p.y + .2 * Math.sin(p.timer * .15)
        p.timer = p.timer + p.v;

    }
    window.requestAnimationFrame(update);
}

init();

update()
//# sourceURL=pen.js

var btn = document.getElementById("body1");

btn.onclick = function (e) {
    window.location.href = "/index";
};

</script>


<canvas width="1920" height="445" id="notFound" style="cursor: inherit;"></canvas>
</body>
</html>