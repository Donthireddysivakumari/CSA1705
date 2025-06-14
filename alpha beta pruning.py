def alphabeta(depth, nodeIndex, isMax, scores, alpha, beta):
    if depth == 3:  # Leaf node depth
        return scores[nodeIndex]

    if isMax:
        best = float('-inf')
        for i in range(2):
            val = alphabeta(depth + 1, nodeIndex * 2 + i, False, scores, alpha, beta)
            best = max(best, val)
            alpha = max(alpha, best)
            if beta <= alpha:
                break  # β cut-off
        return best
    else:
        best = float('inf')
        for i in range(2):
            val = alphabeta(depth + 1, nodeIndex * 2 + i, True, scores, alpha, beta)
            best = min(best, val)
            beta = min(beta, best)
            if beta <= alpha:
                break  # α cut-off
        return best

# Example game tree leaves
scores = [3, 5, 6, 9, 1, 2, 0, -1]
print("Best score:", alphabeta(0, 0, True, scores, float('-inf'), float('inf')))
