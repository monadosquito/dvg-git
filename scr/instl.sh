mkdir --parents $out/bin
cp $src/utl.sh $out
echo "echo '$out'" > $out/bin/get-dvg-git-out
chmod u+x $out/bin/get-dvg-git-out
install $src/init-dvg-git.sh $out/bin/init-dvg-git
mkdir $out/git-hook
install $src/git-hook/post-checkout.sh $out/git-hook/post-checkout
install $src/git-hook/post-commit.sh $out/git-hook/post-commit
install $src/git-hook/post-rewrite.sh $out/git-hook/post-rewrite
install \
    $src/git-hook/reference-transaction.sh \
    $out/git-hook/reference-transaction
