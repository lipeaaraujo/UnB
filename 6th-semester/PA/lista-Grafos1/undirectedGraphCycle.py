graph = {
  1: [2],
  2: [1, 3, 5],
  3: [2, 4],
  4: [3, 5],
  5: [2, 4],
}

def findCycleDFS(graph, start):
  queue = [start]
  visited = {start}
  parent = dict()
  
  while len(queue):
    current_node = queue.pop()
    for neighbor in graph[current_node]:
      if neighbor not in visited:
        queue.append(neighbor)
        visited.add(neighbor)
        parent[neighbor] = current_node  
      elif neighbor != parent[current_node]:
        # found cycle
        cycle = [neighbor, current_node]
        cycle_node = current_node
        while (cycle_node != parent[neighbor]):
          cycle.append(parent[cycle_node])
          cycle_node = parent[cycle_node]
        cycle.reverse()
        return cycle
      
  return None
                
print(findCycleDFS(graph, 1))