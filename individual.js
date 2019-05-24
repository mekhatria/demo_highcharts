/**
 * @license http://creativecommons.org/licenses/by-sa/4.0/ Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
 * @author  Mustapha Mekhatria
 * @version 1.0.0
 */

// JSLint options:
/*global Highcharts, window*/
(function(H) {

    Highcharts.SVGRenderer.prototype.symbols.individual = function(x, y, w, h, r) {
        return [
            'M', x+w*(2/5), y+h/2, 
            'A', 8, 8, 0,1,1, x+(w*3/5),y+h/2 ,
            'L', x+(w*4/5), y+h,
            x+(w*1/5),y+h
        ];
    };
}(Highcharts));
