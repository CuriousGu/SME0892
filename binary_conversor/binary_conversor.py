def convert_int_to_binary(n: int) -> int:
    r = n % 2
    q = n // 2
    i = 1
    binary = r

    while q != 0:
        r = q % 2
        q //= 2

        binary += r * (10**i)
        i += 1

    return binary
