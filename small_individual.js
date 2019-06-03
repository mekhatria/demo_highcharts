(function(H) {

    Highcharts.SVGRenderer.prototype.symbols.individual = function(x, y, w, h, r) {
        return [
            'M', x+w*(2/5), y+h/2, 
            'A', w/3, w/3, 0,1,1, x+(w*3/5),y+h/2 ,
            'L', x+(w*4/5), y+h,
            x+(w*1/5),y+h
        ];
    };
}(Highcharts));
