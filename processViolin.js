
function processViolin (step, ...args) {
    
    let xiData = [];
  //process the xi
  function prcessXi(...args) {
    let tempXdata = [];
    let tileSteps = 6; //Nbr of point at the top and end of the violin
    let min = Infinity,
      max = -Infinity;

    //Auto function to process the x data
    args[0].forEach((e) => {
      min = Math.min(min, Math.min(...e));
      max = Math.max(max, Math.max(...e));
    });

    for (i = min - tileSteps * step; i < max + tileSteps * step; i++) {
      tempXdata.push(i);
    }
    return tempXdata;
  }
  xiData = prcessXi(args);

  //the KDE gaussian function
  function kdeProcess(xi, u) {
    return (1 / Math.sqrt(2 * Math.PI)) * Math.exp(Math.pow(xi - u, 2) / -2);
  }
  let gap = -1;
  //Create the upper and lower line of the violin
  function violinProcess(dataSource) {
    let data = [];
    let N = dataSource.length;

    gap++;
    for (i = 0; i < xiData.length; i++) {
      let temp = 0;
      for (j = 0; j < dataSource.length; j++) {
        temp = temp + kdeProcess(xiData[i], dataSource[j]);
      }
      data.push([xiData[i], (1 / N) * temp]);
    }

    let precision = 0.00005;
    return data.map((violinPoint, i) => {
      if (violinPoint[1] > precision) {
        return [xiData[i], -violinPoint[1] + gap, violinPoint[1] + gap];
      } else {
        return [xiData[i], null, null];
      }
    });
  }

  let tempResult = [];
  let stat = [];
  let index = 0;

  args.forEach((e) => {
    tempResult.push([]);
    stat.push([]);
    tempResult[index] = violinProcess(e).slice();
    //Min, Q1, Median, Q3, Max
    stat[index].push(
      Math.min(...e),
      jStat.quartiles(e)[0],
      jStat.quartiles(e)[1],
      jStat.quartiles(e)[2],
      Math.max(...e)
    );
    index++;
  });
  return [xiData, tempResult, stat];
    
    
    
}
