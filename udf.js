// Example user-defined function, documentation: https://goo.gl/6KR8O0
// Sample SQL: SELECT outputA, outputB FROM (passthrough(SELECT "abc" AS inputA, "def" AS inputB))

/*
function passthroughExample(row, emit) {
  emit({outputA: row.inputA, outputB: row.inputB});
}

bigquery.defineFunction(
  'passthrough',                           // Name of the function exported to SQL
  ['inputA', 'inputB'],                    // Names of input columns
  [{'name': 'outputA', 'type': 'string'},  // Output schema
   {'name': 'outputB', 'type': 'string'}],
  passthroughExample                       // Reference to JavaScript UDF
);
*/

// The UDF
function urlDecode(row, emit) {
    emit({timestamp: row.timestamp, decoded_URL: decodeHelper(row.httpRequest.requestUrl)});
  }
  
  // Helper function for error handling
  function decodeHelper(s) {
    try {
      return decodeURI(s);
    } catch (ex) {
      return s;
    }
  }
  
  // UDF registration
  bigquery.defineFunction(
    'urlDecode',  // Name used to call the function from SQL
  
    ['httpRequest.requestUrl', 'timestamp'],  // Input column names
  
    // JSON representation of the output schema
    [{name: 'decoded_URL', type: 'string'}, {name: 'timestamp', type: 'timestamp'}],
  
    urlDecode  // The function reference
  );