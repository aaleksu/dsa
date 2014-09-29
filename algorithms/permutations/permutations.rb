def permutations(str)
  return str.split(//).permutation.map &:join
  l = str.length

  return [str] if l <= 1

  perms = []
  perms << str
  perms << str.reverse

  first_char = str[0]
  all_rest_perms = permutations str[1...l]

  for rest_perm in all_rest_perms do
    perm_l = rest_perm.length

    0.upto(perm_l - 1) do |i|
      new_perm = "%s%s%s" % [rest_perm[0...i], first_char, rest_perm[i...perm_l]]
      #p new_perm
      perms << new_perm unless perms.include?(new_perm)
    end
  end

  perms
end

st = Time.now
p permutations ARGV[0]

exec_time = (Time.now - st) * 1000.0
p "Total execution time is %s" % exec_time

# Ruby permutations C source
# rb_ary_permutation(int argc, VALUE *argv, VALUE ary)
# {
#     VALUE num;
#     long r, n, i;
#
#     n = RARRAY_LEN(ary);                  /* Array length */
#     RETURN_SIZED_ENUMERATOR(ary, argc, argv, rb_ary_permutation_size);   /* Return enumerator if no block */
#     rb_scan_args(argc, argv, "01", &num);
#     r = NIL_P(num) ? n : NUM2LONG(num);   /* Permutation size from argument */
#
#     if (r < 0 || n < r) {
#         /* no permutations: yield nothing */
#     }
#     else if (r == 0) { /* exactly one permutation: the zero-length array */
#         rb_yield(rb_ary_new2(0));
#     }
#     else if (r == 1) { /* this is a special, easy case */
#         for (i = 0; i < RARRAY_LEN(ary); i++) {
#             rb_yield(rb_ary_new3(1, RARRAY_AREF(ary, i)));
#         }
#     }
#     else {             /* this is the general case */
#         volatile VALUE t0 = tmpbuf(r,sizeof(long));
#         long *p = (long*)RSTRING_PTR(t0);
#         volatile VALUE t1 = tmpbuf(n,sizeof(char));
#         char *used = (char*)RSTRING_PTR(t1);
#         VALUE ary0 = ary_make_shared_copy(ary); /* private defensive copy of ary */
#         RBASIC_CLEAR_CLASS(ary0);
#
#         MEMZERO(used, char, n); /* initialize array */
#
#         permute0(n, r, p, 0, used, ary0); /* compute and yield permutations */
#         tmpbuf_discard(t0);
#         tmpbuf_discard(t1);
#         RBASIC_SET_CLASS_RAW(ary0, rb_cArray);
#     }
#
#     return ary;
# }