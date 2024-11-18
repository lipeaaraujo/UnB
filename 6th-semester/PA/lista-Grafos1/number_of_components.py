graph = {
  1: [2, 3],
  2: [1, 3, 4, 5],
  3: [1, 7, 8, 5, 2],
  4: [2, 5],
  5: [2, 3, 6],
  6: [5],
  7: [3, 8],
  8: [3, 7],
  9: [10],
  10: [9],
  11: [12],
  12: [11, 13],
  13: [12],
}

def bfs(graph, node, components, num_components):
  queue = [node]
  visited = {node}
  
  while len(queue):
    current_node = queue.pop(0)
    components[current_node] = num_components
    for neighbor in graph[current_node]:
      if neighbor not in visited:
        queue.append(neighbor)
        visited.add(neighbor)

def num_of_components(graph):
  components = dict()
  num_components = 0
  for node in graph:
    if node not in components:
      num_components += 1
      bfs(graph, node, components, num_components)
      
  return num_components
    
print(num_of_components(graph))