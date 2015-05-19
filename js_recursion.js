var range = function(start, stop) {
  if (start === stop) {
    return stop;
  } else {
    var results = [start];
    results = results.concat(range(start + 1, stop));
  }

  return results;
}


var exponentiation = function(base, power) {
  if (power === 0) {
    return 1
  };

  return base * exponentiation(base, power - 1);
};


var fibonacci = function(num) {
  switch (num) {
    case 0:
      return [];
      break;
    case 1:
      return [1];
      break;
    case 2:
      return [1, 1];
      break;
    default:
      var results = fibonacci(num - 1);
      results.push(results[results.length - 1] + results[results.length - 2]);
      return results;
  };
};


var binarySearch = function(arr, target) {
  mid = Math.floor(arr.length / 2);

  if (arr[mid] === target) {
    return mid;
  } else if (arr[mid] > target) {
    return binarySearch(arr.slice(0, mid), target);
  } else if (arr[mid] < target) {
    return mid + 1 + binarySearch(arr.slice(mid + 1), target);
  } else {
    return undefined;
  }
};


var makeChange = function(value, coins) {
  if (coins === undefined && typeof(coins) !== "array") {
    coins = [10, 7, 1];
  }

  var results = [];

  if(value === 0) {
    return [];
  } else {

    for (var i in coins) {
      if (coins[i] <= value) {
        results.push([coins[i]].concat(makeChange(value - coins[i], coins)[0]));
      }
    }
  }
};


var merge = function(left, right) {
  var merged = [];

  while (left.length > 0 && right.length > 0) {
    var nextItem = (left[0] < right[0]) ? left.shift() : right.shift();
    merged.push(nextItem);
  }

  return merged.concat(left).concat(right);
};

var mergeSort = function(array) {
  if (array.length < 2) {
    return array;
  } else {
    var middle = Math.floor(array.length / 2);

    var left = mergeSort(array.slice(0, middle));
    var right = mergeSort(array.slice(middle));

    return merge(left, right);
  }
};

var subsets = function(array) {
  if (array.length === 0) {
    return [[]];
  }

  var lastElement = array[0];
  var subSubsets = subsets(array.slice(1));

  var newSubsets = subSubsets.map(function(subSubset) {
    return subSubset.concat(lastElement);
  });

  return newSubsets.concat(subSubsets);
};

