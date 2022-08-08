# BFS(root, target)
#     create a queue
#     add roote node to queue
#     loop through queue untiol empty
#         remove first node from queue
#         check: if removed node is target
#             return nide
#             else add to queue
#     return nil if we made it through tree wihtout finding target
# end

#DFS(root, target)
#   start at root node
#   base case: if node is target, return node
#   else iterate through the nodes chldren
#       call dfs on each child node
#       if result is not nil, return node (we found node and want to return it)
#
#
#      return nil if target was not found
# end