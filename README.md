# Cockroachdb Causality Tokens
I'm just documenting some learnings about cockroachdb's causality tokens.


## Links
- <https://www.cockroachlabs.com/blog/living-without-atomic-clocks/>
- <https://github.com/cockroachdb/cockroach/issues/79591>

## Notes

You can obtain the “commit timestamp”, or the “causality token” for your currently running transaction via the `cluster_logical_timestamp()` function. The return value of that function will give you the global order of your transaction across the cluster.

If you don’t commit within a very short window after calling that function, cockroach will force your transaction to restart. Which makes, sense. Because it determines what the value of the function is going to return while the transaction is currently running.
