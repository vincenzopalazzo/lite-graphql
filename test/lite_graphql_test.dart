import 'package:lite_graphql/lite_graphql.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';

void main() {
  var logger = Logger();
  String url = "https://api.lnmetrics.info/query";
  var client = GraphQLClient(baseUrl: url);
  client.addQuery("QUERY_LIST_NODES", """
    query {
       getNodes(network: "bitcoin") {
          alias
          node_id
        }
    }
  """);
  test("graphql connection test one", () async {
    var listNodes = await client.useQuery(key: "QUERY_LIST_NODES");
    logger.d(
        "Request to get the list of nodes return the following payload\n$listNodes");
    expect(listNodes, allOf([isNot(null), isNot({})]));
  });
}
