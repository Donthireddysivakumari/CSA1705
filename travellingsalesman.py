dist = [
    [0, 10, 15],
    [10, 0, 20],
    [15, 20, 0]
]
paths = [
    [0, 1, 2, 0],
    [0, 2, 1, 0]
]
min_cost = 99999
best_path = []
for path in paths:
    cost = 0
    for i in range(len(path) - 1):
        cost += dist[path[i]][path[i+1]]
    if cost < min_cost:
        min_cost = cost
        best_path = path
print("Best Path:", best_path)
print("Minimum Cost:", min_cost)
