def solve(q=[], row=0):
    if row == 8:
        for r in range(8):
            print(" ".join("Q" if q[r] == c else "." for c in range(8)))
        return True
    for col in range(8):
        if all(c != col and abs(c - col) != row - r for r, c in enumerate(q)):
            if solve(q + [col], row + 1):
                return True

solve()
