from queue import PriorityQueue

def a_star_algorithm(start_node, goal_node, graph, heuristic):
    open_list = PriorityQueue()
    open_list.put((0, start_node))
    came_from = {}
    g_score = {node: float('inf') for node in graph}
    g_score[start_node] = 0

    f_score = {node: float('inf') for node in graph}
    f_score[start_node] = heuristic[start_node]

    while not open_list.empty():
        current = open_list.get()[1]

        if current == goal_node:
            path = []
            while current in came_from:
                path.append(current)
                current = came_from[current]
            path.append(start_node)
            return path[::-1]  # Return reversed path

        for neighbor, cost in graph[current].items():
            tentative_g_score = g_score[current] + cost
            if tentative_g_score < g_score[neighbor]:
                came_from[neighbor] = current
                g_score[neighbor] = tentative_g_score
                f_score[neighbor] = tentative_g_score + heuristic[neighbor]
                open_list.put((f_score[neighbor], neighbor))

    return None  # No path found

# Example Graph and Heuristic
graph = {
    'A': {'B': 1, 'C': 3},
    'B': {'A': 1, 'D': 1, 'E': 5},
    'C': {'A': 3, 'F': 6},
    'D': {'B': 1},
    'E': {'B': 5, 'F': 2},
    'F': {'C': 6, 'E': 2}
}

heuristic = {
    'A': 6,
    'B': 4,
    'C': 4,
    'D': 2,
    'E': 2,
    'F': 0  # Goal
}

# Run A* Algorithm
start = 'A'
goal = 'F'
result_path = a_star_algorithm(start, goal, graph, heuristic)

# Output Result
print("Shortest path from", start, "to", goal, "is:", result_path)
