Notes:blocks and inodes have ad-hoc sleep-locks
TRICKS:at that point, cp->tf is set to point to a trap frame
TRICKS:The code in fork needs to read np->pid before
TRICKS:setting np->state to RUNNABLE.  The following
TRICKS:	  np->state = RUNNABLE;
TRICKS:	  return np->pid; // oops
TRICKS:After setting np->state to RUNNABLE, some other CPU
TRICKS:"return np->pid". Even saving a copy of np->pid before
TRICKS:setting np->state isn't safe, since the compiler is
TRICKS:The real code saves a copy of np->pid, then acquires a lock
TRICKS:around the write to np->state. The acquire() prevents the
Binary file _getnumproc_test matches
cat.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
cat.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
cat.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
cat.asm:  if(bp + bp->s.size == p->s.ptr){
cat.asm:    bp->s.size += p->s.ptr->s.size;
cat.asm:    bp->s.ptr = p->s.ptr->s.ptr;
cat.asm:    bp->s.ptr = p->s.ptr;
cat.asm:  if(p + p->s.size == bp){
cat.asm:    p->s.size += bp->s.size;
cat.asm:    p->s.ptr = bp->s.ptr;
cat.asm:    p->s.ptr = bp;
cat.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
cat.asm:    bp->s.size += p->s.ptr->s.size;
cat.asm:    bp->s.ptr = p->s.ptr->s.ptr;
cat.asm:  if(p + p->s.size == bp){
cat.asm:    p->s.size += bp->s.size;
cat.asm:    p->s.size += bp->s.size;
cat.asm:    p->s.ptr = bp->s.ptr;
cat.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
cat.asm:    if(p->s.size >= nunits){
cat.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
cat.asm:    if(p->s.size >= nunits){
cat.asm:        p->s.size = nunits;
cat.asm:  hp->s.size = nu;
cat.asm:      if(p->s.size == nunits)
cat.asm:        p->s.size -= nunits;
cat.asm:        p += p->s.size;
cat.asm:        p->s.size = nunits;
cat.asm:        prevp->s.ptr = p->s.ptr;
echo.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
echo.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
echo.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
echo.asm:  if(bp + bp->s.size == p->s.ptr){
echo.asm:    bp->s.size += p->s.ptr->s.size;
echo.asm:    bp->s.ptr = p->s.ptr->s.ptr;
echo.asm:    bp->s.ptr = p->s.ptr;
echo.asm:  if(p + p->s.size == bp){
echo.asm:    p->s.size += bp->s.size;
echo.asm:    p->s.ptr = bp->s.ptr;
echo.asm:    p->s.ptr = bp;
echo.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
echo.asm:    bp->s.size += p->s.ptr->s.size;
echo.asm:    bp->s.ptr = p->s.ptr->s.ptr;
echo.asm:  if(p + p->s.size == bp){
echo.asm:    p->s.size += bp->s.size;
echo.asm:    p->s.size += bp->s.size;
echo.asm:    p->s.ptr = bp->s.ptr;
echo.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
echo.asm:    if(p->s.size >= nunits){
echo.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
echo.asm:    if(p->s.size >= nunits){
echo.asm:        p->s.size = nunits;
echo.asm:  hp->s.size = nu;
echo.asm:      if(p->s.size == nunits)
echo.asm:        p->s.size -= nunits;
echo.asm:        p += p->s.size;
echo.asm:        p->s.size = nunits;
echo.asm:        prevp->s.ptr = p->s.ptr;
fs.c:  memmove(sb, bp->data, sizeof(*sb));
fs.c:  memset(bp->data, 0, BSIZE);
fs.c:      if((bp->data[bi/8] & m) == 0){  // Is block free?
fs.c:        bp->data[bi/8] |= m;  // Mark block in use.
fs.c:  if((bp->data[bi/8] & m) == 0)
fs.c:  bp->data[bi/8] &= ~m;
fs.c:// not stored on disk: ip->ref and ip->valid.
fs.c://   is free if ip->ref is zero. Otherwise ip->ref tracks
fs.c://   cache entry is only correct when ip->valid is 1.
fs.c://   the disk and sets ip->valid, while iput() clears
fs.c://   ip->valid if ip->ref has fallen to zero.
fs.c://   ... examine and modify ip->xxx ...
fs.c:// pathname lookup. iget() increments ip->ref so that the inode
fs.c:// entries. Since ip->ref indicates whether an entry is free,
fs.c:// and ip->dev and ip->inum indicate which i-node an entry
fs.c:// An ip->lock sleep-lock protects all ip-> fields other than ref,
fs.c:// dev, and inum.  One must hold ip->lock in order to
fs.c:// read or write that inode's ip->valid, ip->size, ip->type, &c.
fs.c:    dip = (struct dinode*)bp->data + inum%IPB;
fs.c:    if(dip->type == 0){  // a free inode
fs.c:      dip->type = type;
fs.c:// Must be called after every change to an ip->xxx field
fs.c:// Caller must hold ip->lock.
fs.c:  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
fs.c:  dip = (struct dinode*)bp->data + ip->inum%IPB;
fs.c:  dip->type = ip->type;
fs.c:  dip->major = ip->major;
fs.c:  dip->minor = ip->minor;
fs.c:  dip->nlink = ip->nlink;
fs.c:  dip->size = ip->size;
fs.c:  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
fs.c:    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
fs.c:      ip->ref++;
fs.c:    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
fs.c:  ip->dev = dev;
fs.c:  ip->inum = inum;
fs.c:  ip->ref = 1;
fs.c:  ip->valid = 0;
fs.c:  ip->ref++;
fs.c:  if(ip == 0 || ip->ref < 1)
fs.c:  acquiresleep(&ip->lock);
fs.c:  if(ip->valid == 0){
fs.c:    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
fs.c:    dip = (struct dinode*)bp->data + ip->inum%IPB;
fs.c:    ip->type = dip->type;
fs.c:    ip->major = dip->major;
fs.c:    ip->minor = dip->minor;
fs.c:    ip->nlink = dip->nlink;
fs.c:    ip->size = dip->size;
fs.c:    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
fs.c:    ip->valid = 1;
fs.c:    if(ip->type == 0)
fs.c:  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
fs.c:  releasesleep(&ip->lock);
fs.c:  acquiresleep(&ip->lock);
fs.c:  if(ip->valid && ip->nlink == 0){
fs.c:    int r = ip->ref;
fs.c:      ip->type = 0;
fs.c:      ip->valid = 0;
fs.c:  releasesleep(&ip->lock);
fs.c:  ip->ref--;
fs.c:// are listed in ip->addrs[].  The next NINDIRECT blocks are
fs.c:// listed in block ip->addrs[NDIRECT].
fs.c:    if((addr = ip->addrs[bn]) == 0)
fs.c:      ip->addrs[bn] = addr = balloc(ip->dev);
fs.c:    if((addr = ip->addrs[NDIRECT]) == 0)
fs.c:      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
fs.c:    bp = bread(ip->dev, addr);
fs.c:    a = (uint*)bp->data;
fs.c:      a[bn] = addr = balloc(ip->dev);
fs.c:    if(ip->addrs[i]){
fs.c:      bfree(ip->dev, ip->addrs[i]);
fs.c:      ip->addrs[i] = 0;
fs.c:  if(ip->addrs[NDIRECT]){
fs.c:    bp = bread(ip->dev, ip->addrs[NDIRECT]);
fs.c:    a = (uint*)bp->data;
fs.c:        bfree(ip->dev, a[j]);
fs.c:    bfree(ip->dev, ip->addrs[NDIRECT]);
fs.c:    ip->addrs[NDIRECT] = 0;
fs.c:  ip->size = 0;
fs.c:// Caller must hold ip->lock.
fs.c:  st->dev = ip->dev;
fs.c:  st->ino = ip->inum;
fs.c:  st->type = ip->type;
fs.c:  st->nlink = ip->nlink;
fs.c:  st->size = ip->size;
fs.c:// Caller must hold ip->lock.
fs.c:  if(ip->type == T_DEV){
fs.c:    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
fs.c:    return devsw[ip->major].read(ip, dst, n);
fs.c:  if(off > ip->size || off + n < off)
fs.c:  if(off + n > ip->size)
fs.c:    n = ip->size - off;
fs.c:    bp = bread(ip->dev, bmap(ip, off/BSIZE));
fs.c:    memmove(dst, bp->data + off%BSIZE, m);
fs.c:// Caller must hold ip->lock.
fs.c:  if(ip->type == T_DEV){
fs.c:    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
fs.c:    return devsw[ip->major].write(ip, src, n);
fs.c:  if(off > ip->size || off + n < off)
fs.c:    bp = bread(ip->dev, bmap(ip, off/BSIZE));
fs.c:    memmove(bp->data + off%BSIZE, src, m);
fs.c:  if(n > 0 && off > ip->size){
fs.c:    ip->size = off;
fs.c:  if(dp->type != T_DIR)
fs.c:  for(off = 0; off < dp->size; off += sizeof(de)){
fs.c:      return iget(dp->dev, inum);
fs.c:  for(off = 0; off < dp->size; off += sizeof(de)){
fs.c:    if(ip->type != T_DIR){
Binary file fs.img matches
getmaxpid_test.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
getmaxpid_test.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
getmaxpid_test.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
getmaxpid_test.asm:  if(bp + bp->s.size == p->s.ptr){
getmaxpid_test.asm:    bp->s.size += p->s.ptr->s.size;
getmaxpid_test.asm:    bp->s.ptr = p->s.ptr->s.ptr;
getmaxpid_test.asm:    bp->s.ptr = p->s.ptr;
getmaxpid_test.asm:  if(p + p->s.size == bp){
getmaxpid_test.asm:    p->s.size += bp->s.size;
getmaxpid_test.asm:    p->s.ptr = bp->s.ptr;
getmaxpid_test.asm:    p->s.ptr = bp;
getmaxpid_test.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
getmaxpid_test.asm:    bp->s.size += p->s.ptr->s.size;
getmaxpid_test.asm:    bp->s.ptr = p->s.ptr->s.ptr;
getmaxpid_test.asm:  if(p + p->s.size == bp){
getmaxpid_test.asm:    p->s.size += bp->s.size;
getmaxpid_test.asm:    p->s.size += bp->s.size;
getmaxpid_test.asm:    p->s.ptr = bp->s.ptr;
getmaxpid_test.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
getmaxpid_test.asm:    if(p->s.size >= nunits){
getmaxpid_test.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
getmaxpid_test.asm:    if(p->s.size >= nunits){
getmaxpid_test.asm:        p->s.size = nunits;
getmaxpid_test.asm:  hp->s.size = nu;
getmaxpid_test.asm:      if(p->s.size == nunits)
getmaxpid_test.asm:        p->s.size -= nunits;
getmaxpid_test.asm:        p += p->s.size;
getmaxpid_test.asm:        p->s.size = nunits;
getmaxpid_test.asm:        prevp->s.ptr = p->s.ptr;
getnumproc_test.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
getnumproc_test.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
getnumproc_test.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
getnumproc_test.asm:  if(bp + bp->s.size == p->s.ptr){
getnumproc_test.asm:    bp->s.size += p->s.ptr->s.size;
getnumproc_test.asm:    bp->s.ptr = p->s.ptr->s.ptr;
getnumproc_test.asm:    bp->s.ptr = p->s.ptr;
getnumproc_test.asm:  if(p + p->s.size == bp){
getnumproc_test.asm:    p->s.size += bp->s.size;
getnumproc_test.asm:    p->s.ptr = bp->s.ptr;
getnumproc_test.asm:    p->s.ptr = bp;
getnumproc_test.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
getnumproc_test.asm:    bp->s.size += p->s.ptr->s.size;
getnumproc_test.asm:    bp->s.ptr = p->s.ptr->s.ptr;
getnumproc_test.asm:  if(p + p->s.size == bp){
getnumproc_test.asm:    p->s.size += bp->s.size;
getnumproc_test.asm:    p->s.size += bp->s.size;
getnumproc_test.asm:    p->s.ptr = bp->s.ptr;
getnumproc_test.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
getnumproc_test.asm:    if(p->s.size >= nunits){
getnumproc_test.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
getnumproc_test.asm:    if(p->s.size >= nunits){
getnumproc_test.asm:        p->s.size = nunits;
getnumproc_test.asm:  hp->s.size = nu;
getnumproc_test.asm:      if(p->s.size == nunits)
getnumproc_test.asm:        p->s.size -= nunits;
getnumproc_test.asm:        p += p->s.size;
getnumproc_test.asm:        p->s.size = nunits;
getnumproc_test.asm:        prevp->s.ptr = p->s.ptr;
getprocinfo_test.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
getprocinfo_test.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
getprocinfo_test.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
getprocinfo_test.asm:  if(bp + bp->s.size == p->s.ptr){
getprocinfo_test.asm:    bp->s.size += p->s.ptr->s.size;
getprocinfo_test.asm:    bp->s.ptr = p->s.ptr->s.ptr;
getprocinfo_test.asm:    bp->s.ptr = p->s.ptr;
getprocinfo_test.asm:  if(p + p->s.size == bp){
getprocinfo_test.asm:    p->s.size += bp->s.size;
getprocinfo_test.asm:    p->s.ptr = bp->s.ptr;
getprocinfo_test.asm:    p->s.ptr = bp;
getprocinfo_test.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
getprocinfo_test.asm:    bp->s.size += p->s.ptr->s.size;
getprocinfo_test.asm:    bp->s.ptr = p->s.ptr->s.ptr;
getprocinfo_test.asm:  if(p + p->s.size == bp){
getprocinfo_test.asm:    p->s.size += bp->s.size;
getprocinfo_test.asm:    p->s.size += bp->s.size;
getprocinfo_test.asm:    p->s.ptr = bp->s.ptr;
getprocinfo_test.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
getprocinfo_test.asm:    if(p->s.size >= nunits){
getprocinfo_test.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
getprocinfo_test.asm:    if(p->s.size >= nunits){
getprocinfo_test.asm:        p->s.size = nunits;
getprocinfo_test.asm:  hp->s.size = nu;
getprocinfo_test.asm:      if(p->s.size == nunits)
getprocinfo_test.asm:        p->s.size -= nunits;
getprocinfo_test.asm:        p += p->s.size;
getprocinfo_test.asm:        p->s.size = nunits;
getprocinfo_test.asm:        prevp->s.ptr = p->s.ptr;
grep.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
grep.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
grep.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
grep.asm:  if(bp + bp->s.size == p->s.ptr){
grep.asm:    bp->s.size += p->s.ptr->s.size;
grep.asm:    bp->s.ptr = p->s.ptr->s.ptr;
grep.asm:    bp->s.ptr = p->s.ptr;
grep.asm:  if(p + p->s.size == bp){
grep.asm:    p->s.size += bp->s.size;
grep.asm:    p->s.ptr = bp->s.ptr;
grep.asm:    p->s.ptr = bp;
grep.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
grep.asm:    bp->s.size += p->s.ptr->s.size;
grep.asm:    bp->s.ptr = p->s.ptr->s.ptr;
grep.asm:  if(p + p->s.size == bp){
grep.asm:    p->s.size += bp->s.size;
grep.asm:    p->s.size += bp->s.size;
grep.asm:    p->s.ptr = bp->s.ptr;
grep.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
grep.asm:    if(p->s.size >= nunits){
grep.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
grep.asm:    if(p->s.size >= nunits){
grep.asm:        p->s.size = nunits;
grep.asm:  hp->s.size = nu;
grep.asm:      if(p->s.size == nunits)
grep.asm:        p->s.size -= nunits;
grep.asm:        p += p->s.size;
grep.asm:        p->s.size = nunits;
grep.asm:        prevp->s.ptr = p->s.ptr;
hello_test.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
hello_test.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
hello_test.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
hello_test.asm:  if(bp + bp->s.size == p->s.ptr){
hello_test.asm:    bp->s.size += p->s.ptr->s.size;
hello_test.asm:    bp->s.ptr = p->s.ptr->s.ptr;
hello_test.asm:    bp->s.ptr = p->s.ptr;
hello_test.asm:  if(p + p->s.size == bp){
hello_test.asm:    p->s.size += bp->s.size;
hello_test.asm:    p->s.ptr = bp->s.ptr;
hello_test.asm:    p->s.ptr = bp;
hello_test.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
hello_test.asm:    bp->s.size += p->s.ptr->s.size;
hello_test.asm:    bp->s.ptr = p->s.ptr->s.ptr;
hello_test.asm:  if(p + p->s.size == bp){
hello_test.asm:    p->s.size += bp->s.size;
hello_test.asm:    p->s.size += bp->s.size;
hello_test.asm:    p->s.ptr = bp->s.ptr;
hello_test.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
hello_test.asm:    if(p->s.size >= nunits){
hello_test.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
hello_test.asm:    if(p->s.size >= nunits){
hello_test.asm:        p->s.size = nunits;
hello_test.asm:  hp->s.size = nu;
hello_test.asm:      if(p->s.size == nunits)
hello_test.asm:        p->s.size -= nunits;
hello_test.asm:        p += p->s.size;
hello_test.asm:        p->s.size = nunits;
hello_test.asm:        prevp->s.ptr = p->s.ptr;
helloname_test.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
helloname_test.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
helloname_test.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
helloname_test.asm:  if(bp + bp->s.size == p->s.ptr){
helloname_test.asm:    bp->s.size += p->s.ptr->s.size;
helloname_test.asm:    bp->s.ptr = p->s.ptr->s.ptr;
helloname_test.asm:    bp->s.ptr = p->s.ptr;
helloname_test.asm:  if(p + p->s.size == bp){
helloname_test.asm:    p->s.size += bp->s.size;
helloname_test.asm:    p->s.ptr = bp->s.ptr;
helloname_test.asm:    p->s.ptr = bp;
helloname_test.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
helloname_test.asm:    bp->s.size += p->s.ptr->s.size;
helloname_test.asm:    bp->s.ptr = p->s.ptr->s.ptr;
helloname_test.asm:  if(p + p->s.size == bp){
helloname_test.asm:    p->s.size += bp->s.size;
helloname_test.asm:    p->s.size += bp->s.size;
helloname_test.asm:    p->s.ptr = bp->s.ptr;
helloname_test.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
helloname_test.asm:    if(p->s.size >= nunits){
helloname_test.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
helloname_test.asm:    if(p->s.size >= nunits){
helloname_test.asm:        p->s.size = nunits;
helloname_test.asm:  hp->s.size = nu;
helloname_test.asm:      if(p->s.size == nunits)
helloname_test.asm:        p->s.size -= nunits;
helloname_test.asm:        p += p->s.size;
helloname_test.asm:        p->s.size = nunits;
helloname_test.asm:        prevp->s.ptr = p->s.ptr;
init.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
init.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
init.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
init.asm:  if(bp + bp->s.size == p->s.ptr){
init.asm:    bp->s.size += p->s.ptr->s.size;
init.asm:    bp->s.ptr = p->s.ptr->s.ptr;
init.asm:    bp->s.ptr = p->s.ptr;
init.asm:  if(p + p->s.size == bp){
init.asm:    p->s.size += bp->s.size;
init.asm:    p->s.ptr = bp->s.ptr;
init.asm:    p->s.ptr = bp;
init.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
init.asm:    bp->s.size += p->s.ptr->s.size;
init.asm:    bp->s.ptr = p->s.ptr->s.ptr;
init.asm:  if(p + p->s.size == bp){
init.asm:    p->s.size += bp->s.size;
init.asm:    p->s.size += bp->s.size;
init.asm:    p->s.ptr = bp->s.ptr;
init.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
init.asm:    if(p->s.size >= nunits){
init.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
init.asm:    if(p->s.size >= nunits){
init.asm:        p->s.size = nunits;
init.asm:  hp->s.size = nu;
init.asm:      if(p->s.size == nunits)
init.asm:        p->s.size -= nunits;
init.asm:        p += p->s.size;
init.asm:        p->s.size = nunits;
init.asm:        prevp->s.ptr = p->s.ptr;
kernel.asm:      if((bp->data[bi/8] & m) == 0){  // Is block free?
kernel.asm:      if((bp->data[bi/8] & m) == 0){  // Is block free?
kernel.asm:        bp->data[bi/8] |= m;  // Mark block in use.
kernel.asm:        bp->data[bi/8] |= m;  // Mark block in use.
kernel.asm:  memset(bp->data, 0, BSIZE);
kernel.asm:    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
kernel.asm:      ip->ref++;
kernel.asm:    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
kernel.asm:  ip->dev = dev;
kernel.asm:  ip->inum = inum;
kernel.asm:  ip->ref = 1;
kernel.asm:  ip->valid = 0;
kernel.asm:  ip->dev = dev;
kernel.asm:  ip->inum = inum;
kernel.asm:  ip->ref = 1;
kernel.asm:  ip->valid = 0;
kernel.asm:    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
kernel.asm:      ip->ref++;
kernel.asm:      ip->ref++;
kernel.asm:    if((addr = ip->addrs[bn]) == 0)
kernel.asm:    if((addr = ip->addrs[NDIRECT]) == 0)
kernel.asm:    bp = bread(ip->dev, addr);
kernel.asm:    bp = bread(ip->dev, addr);
kernel.asm:      a[bn] = addr = balloc(ip->dev);
kernel.asm:      a[bn] = addr = balloc(ip->dev);
kernel.asm:      ip->addrs[bn] = addr = balloc(ip->dev);
kernel.asm:      ip->addrs[bn] = addr = balloc(ip->dev);
kernel.asm:      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
kernel.asm:  memmove(sb, bp->data, sizeof(*sb));
kernel.asm:  if((bp->data[bi/8] & m) == 0)
kernel.asm:  if((bp->data[bi/8] & m) == 0)
kernel.asm:  if((bp->data[bi/8] & m) == 0)
kernel.asm:  bp->data[bi/8] &= ~m;
kernel.asm:  bp->data[bi/8] &= ~m;
kernel.asm:    dip = (struct dinode*)bp->data + inum%IPB;
kernel.asm:    if(dip->type == 0){  // a free inode
kernel.asm:    dip = (struct dinode*)bp->data + inum%IPB;
kernel.asm:    if(dip->type == 0){  // a free inode
kernel.asm:      dip->type = type;
kernel.asm:  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
kernel.asm:  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
kernel.asm:  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
kernel.asm:  dip = (struct dinode*)bp->data + ip->inum%IPB;
kernel.asm:  dip->type = ip->type;
kernel.asm:  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
kernel.asm:  dip = (struct dinode*)bp->data + ip->inum%IPB;
kernel.asm:  dip->type = ip->type;
kernel.asm:  dip->major = ip->major;
kernel.asm:  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
kernel.asm:  dip->major = ip->major;
kernel.asm:  dip->minor = ip->minor;
kernel.asm:  dip->nlink = ip->nlink;
kernel.asm:  dip->size = ip->size;
kernel.asm:  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
kernel.asm:  ip->ref++;
kernel.asm:  if(ip == 0 || ip->ref < 1)
kernel.asm:  acquiresleep(&ip->lock);
kernel.asm:  if(ip->valid == 0){
kernel.asm:    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
kernel.asm:    dip = (struct dinode*)bp->data + ip->inum%IPB;
kernel.asm:    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
kernel.asm:    dip = (struct dinode*)bp->data + ip->inum%IPB;
kernel.asm:    ip->type = dip->type;
kernel.asm:    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
kernel.asm:    ip->type = dip->type;
kernel.asm:    ip->major = dip->major;
kernel.asm:    ip->minor = dip->minor;
kernel.asm:    ip->nlink = dip->nlink;
kernel.asm:    ip->size = dip->size;
kernel.asm:    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
kernel.asm:    if(ip->type == 0)
kernel.asm:    ip->valid = 1;
kernel.asm:    if(ip->type == 0)
kernel.asm:  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
kernel.asm:  releasesleep(&ip->lock);
kernel.asm:  releasesleep(&ip->lock);
kernel.asm:  acquiresleep(&ip->lock);
kernel.asm:  if(ip->valid && ip->nlink == 0){
kernel.asm:  releasesleep(&ip->lock);
kernel.asm:  ip->ref--;
kernel.asm:    int r = ip->ref;
kernel.asm:    if(ip->addrs[i]){
kernel.asm:      bfree(ip->dev, ip->addrs[i]);
kernel.asm:      ip->addrs[i] = 0;
kernel.asm:  if(ip->addrs[NDIRECT]){
kernel.asm:    bfree(ip->dev, ip->addrs[NDIRECT]);
kernel.asm:    ip->addrs[NDIRECT] = 0;
kernel.asm:  ip->size = 0;
kernel.asm:  ip->size = 0;
kernel.asm:      ip->type = 0;
kernel.asm:      ip->valid = 0;
kernel.asm:    bp = bread(ip->dev, ip->addrs[NDIRECT]);
kernel.asm:    a = (uint*)bp->data;
kernel.asm:        bfree(ip->dev, a[j]);
kernel.asm:    bfree(ip->dev, ip->addrs[NDIRECT]);
kernel.asm:    ip->addrs[NDIRECT] = 0;
kernel.asm:// Caller must hold ip->lock.
kernel.asm:  st->dev = ip->dev;
kernel.asm:  st->ino = ip->inum;
kernel.asm:  st->type = ip->type;
kernel.asm:  st->nlink = ip->nlink;
kernel.asm:  st->size = ip->size;
kernel.asm:// Caller must hold ip->lock.
kernel.asm:  if(ip->type == T_DEV){
kernel.asm:  if(ip->type == T_DEV){
kernel.asm:    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
kernel.asm:    return devsw[ip->major].read(ip, dst, n);
kernel.asm:  if(off > ip->size || off + n < off)
kernel.asm:  if(off + n > ip->size)
kernel.asm:    n = ip->size - off;
kernel.asm:    n = ip->size - off;
kernel.asm:    bp = bread(ip->dev, bmap(ip, off/BSIZE));
kernel.asm:    bp = bread(ip->dev, bmap(ip, off/BSIZE));
kernel.asm:    memmove(dst, bp->data + off%BSIZE, m);
kernel.asm:    memmove(dst, bp->data + off%BSIZE, m);
kernel.asm:    memmove(dst, bp->data + off%BSIZE, m);
kernel.asm:    memmove(dst, bp->data + off%BSIZE, m);
kernel.asm:    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
kernel.asm:    return devsw[ip->major].read(ip, dst, n);
kernel.asm:    return devsw[ip->major].read(ip, dst, n);
kernel.asm:// Caller must hold ip->lock.
kernel.asm:  if(ip->type == T_DEV){
kernel.asm:  if(ip->type == T_DEV){
kernel.asm:    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
kernel.asm:    return devsw[ip->major].write(ip, src, n);
kernel.asm:  if(off > ip->size || off + n < off)
kernel.asm:    bp = bread(ip->dev, bmap(ip, off/BSIZE));
kernel.asm:    bp = bread(ip->dev, bmap(ip, off/BSIZE));
kernel.asm:    memmove(bp->data + off%BSIZE, src, m);
kernel.asm:    memmove(bp->data + off%BSIZE, src, m);
kernel.asm:    memmove(bp->data + off%BSIZE, src, m);
kernel.asm:  if(n > 0 && off > ip->size){
kernel.asm:    ip->size = off;
kernel.asm:    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
kernel.asm:    return devsw[ip->major].write(ip, src, n);
kernel.asm:    return devsw[ip->major].write(ip, src, n);
kernel.asm:    ip->size = off;
kernel.asm:    ip->size = off;
kernel.asm:  if(dp->type != T_DIR)
kernel.asm:  for(off = 0; off < dp->size; off += sizeof(de)){
kernel.asm:  for(off = 0; off < dp->size; off += sizeof(de)){
kernel.asm:      return iget(dp->dev, inum);
kernel.asm:      return iget(dp->dev, inum);
kernel.asm:  ip->ref++;
kernel.asm:    if(ip->type != T_DIR){
kernel.asm:  for(off = 0; off < dp->size; off += sizeof(de)){
kernel.asm://   modify bp->data[]
kernel.asm:    if((mp = mpsearch1(p-1024, 1024)))
kernel.asm:  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
kernel.asm:  conf = (struct mpconf*) P2V((uint) mp->physaddr);
kernel.asm:  if(mp->imcrp){
kernel.asm:  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
kernel.asm:  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
kernel.asm:  initlock(&p->lock, "pipe");
kernel.asm:  p->readopen = 1;
kernel.asm:  p->writeopen = 1;
kernel.asm:  p->nwrite = 0;
kernel.asm:  p->nread = 0;
kernel.asm:  initlock(&p->lock, "pipe");
kernel.asm:  acquire(&p->lock);
kernel.asm:    p->writeopen = 0;
kernel.asm:    wakeup(&p->nread);
kernel.asm:    p->writeopen = 0;
kernel.asm:    wakeup(&p->nread);
kernel.asm:    p->readopen = 0;
kernel.asm:    wakeup(&p->nwrite);
kernel.asm:  if(p->readopen == 0 && p->writeopen == 0){
kernel.asm:    release(&p->lock);
kernel.asm:    release(&p->lock);
kernel.asm:    release(&p->lock);
kernel.asm:    wakeup(&p->nwrite);
kernel.asm:    p->readopen = 0;
kernel.asm:    wakeup(&p->nwrite);
kernel.asm:    release(&p->lock);
kernel.asm:  acquire(&p->lock);
kernel.asm:    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
kernel.asm:      if(p->readopen == 0 || myproc()->killed){
kernel.asm:        release(&p->lock);
kernel.asm:      wakeup(&p->nread);
kernel.asm:    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
kernel.asm:      if(p->readopen == 0 || myproc()->killed){
kernel.asm:      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
kernel.asm:      wakeup(&p->nread);
kernel.asm:      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
kernel.asm:    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
kernel.asm:      if(p->readopen == 0 || myproc()->killed){
kernel.asm:        release(&p->lock);
kernel.asm:    p->data[p->nwrite++ % PIPESIZE] = addr[i];
kernel.asm:  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
kernel.asm:  release(&p->lock);
kernel.asm:    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
kernel.asm:    p->data[p->nwrite++ % PIPESIZE] = addr[i];
kernel.asm:    p->data[p->nwrite++ % PIPESIZE] = addr[i];
kernel.asm:  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
kernel.asm:  release(&p->lock);
kernel.asm:  acquire(&p->lock);
kernel.asm:  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
kernel.asm:      release(&p->lock);
kernel.asm:    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
kernel.asm:  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
kernel.asm:      release(&p->lock);
kernel.asm:      release(&p->lock);
kernel.asm:    addr[i] = p->data[p->nread++ % PIPESIZE];
kernel.asm:  wakeup(&p->nwrite);  //DOC: piperead-wakeup
kernel.asm:  release(&p->lock);
kernel.asm:    if(p->nread == p->nwrite)
kernel.asm:    addr[i] = p->data[p->nread++ % PIPESIZE];
kernel.asm:  wakeup(&p->nwrite);  //DOC: piperead-wakeup
kernel.asm:  release(&p->lock);
kernel.asm:    if(p->state == UNUSED)
kernel.asm:  p->state = EMBRYO;
kernel.asm:  p->pid = nextpid++;
kernel.asm:  p->state = EMBRYO;
kernel.asm:  p->pid = nextpid++;
kernel.asm:  p->pid = nextpid++;
kernel.asm:  if((p->kstack = kalloc()) == 0){
kernel.asm:  sp = p->kstack + KSTACKSIZE;
kernel.asm:  sp -= sizeof *p->tf;
kernel.asm:  sp -= sizeof *p->context;
kernel.asm:  p->context = (struct context*)sp;
kernel.asm:  memset(p->context, 0, sizeof *p->context);
kernel.asm:  sp -= sizeof *p->context;
kernel.asm:  sp -= sizeof *p->tf;
kernel.asm:  p->context = (struct context*)sp;
kernel.asm:  memset(p->context, 0, sizeof *p->context);
kernel.asm:  p->context->eip = (uint)forkret;
kernel.asm:  p->context->eip = (uint)forkret;
kernel.asm:    p->state = UNUSED;
kernel.asm:  if((p->pgdir = setupkvm()) == 0)
kernel.asm:  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
kernel.asm:  memset(p->tf, 0, sizeof(*p->tf));
kernel.asm:  p->sz = PGSIZE;
kernel.asm:  memset(p->tf, 0, sizeof(*p->tf));
kernel.asm:  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
kernel.asm:  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
kernel.asm:  safestrcpy(p->name, "initcode", sizeof(p->name));
kernel.asm:  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
kernel.asm:  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
kernel.asm:  p->tf->es = p->tf->ds;
kernel.asm:  p->tf->ss = p->tf->ds;
kernel.asm:  p->tf->eflags = FL_IF;
kernel.asm:  p->tf->esp = PGSIZE;
kernel.asm:  p->tf->eip = 0;  // beginning of initcode.S
kernel.asm:  safestrcpy(p->name, "initcode", sizeof(p->name));
kernel.asm:  p->cwd = namei("/");
kernel.asm:  p->state = RUNNABLE;
kernel.asm:  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
kernel.asm:  np->sz = curproc->sz;
kernel.asm:  np->parent = curproc;
kernel.asm:  *np->tf = *curproc->tf;
kernel.asm:  np->tf->eax = 0;
kernel.asm:      np->ofile[i] = filedup(curproc->ofile[i]);
kernel.asm:  np->cwd = idup(curproc->cwd);
kernel.asm:  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
kernel.asm:  np->cwd = idup(curproc->cwd);
kernel.asm:  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
kernel.asm:  np->cwd = idup(curproc->cwd);
kernel.asm:  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
kernel.asm:  pid = np->pid;
kernel.asm:  np->state = RUNNABLE;
kernel.asm:    kfree(np->kstack);
kernel.asm:    np->kstack = 0;
kernel.asm:    np->state = UNUSED;
kernel.asm:      if(p->state != RUNNABLE)
kernel.asm:      swtch(&(c->scheduler), p->context);
kernel.asm:      p->state = RUNNING;
kernel.asm:      swtch(&(c->scheduler), p->context);
kernel.asm:  if(p->state == RUNNING)
kernel.asm:  swtch(&p->context, mycpu()->scheduler);
kernel.asm:  swtch(&p->context, mycpu()->scheduler);
kernel.asm:    if(p->state == SLEEPING && p->chan == chan)
kernel.asm:      p->state = RUNNABLE;
kernel.asm:      p->parent = initproc;
kernel.asm:    if(p->parent == curproc){
kernel.asm:      if(p->state == ZOMBIE)
kernel.asm:      p->parent = initproc;
kernel.asm:      if(p->state == ZOMBIE)
kernel.asm:    if(p->state == SLEEPING && p->chan == chan)
kernel.asm:      p->state = RUNNABLE;
kernel.asm:  p->chan = chan;
kernel.asm:  p->state = SLEEPING;
kernel.asm:  p->chan = 0;
kernel.asm:  p->chan = chan;
kernel.asm:  p->state = SLEEPING;
kernel.asm:  p->chan = 0;
kernel.asm:      if(p->parent != curproc)
kernel.asm:      if(p->state == ZOMBIE){
kernel.asm:        kfree(p->kstack);
kernel.asm:        pid = p->pid;
kernel.asm:        kfree(p->kstack);
kernel.asm:        freevm(p->pgdir);
kernel.asm:        p->kstack = 0;
kernel.asm:        freevm(p->pgdir);
kernel.asm:        p->pid = 0;
kernel.asm:        p->parent = 0;
kernel.asm:        p->name[0] = 0;
kernel.asm:        p->killed = 0;
kernel.asm:        p->state = UNUSED;
kernel.asm:    if(p->state == SLEEPING && p->chan == chan)
kernel.asm:      p->state = RUNNABLE;
kernel.asm:    if(p->pid == pid){
kernel.asm:      p->killed = 1;
kernel.asm:      if(p->state == SLEEPING)
kernel.asm:      p->killed = 1;
kernel.asm:      if(p->state == SLEEPING)
kernel.asm:        p->state = RUNNABLE;
kernel.asm:    if(p->state == SLEEPING){
kernel.asm:      getcallerpcs((uint*)p->context->ebp+2, pc);
kernel.asm:    if(p->state == UNUSED)
kernel.asm:    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
kernel.asm:    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
kernel.asm:    cprintf("%d %s %s", p->pid, state, p->name);
kernel.asm:    if(p->state == SLEEPING){
kernel.asm:      getcallerpcs((uint*)p->context->ebp+2, pc);
kernel.asm:    if(type == T_FILE && ip->type == T_FILE)
kernel.asm:  if((ip = ialloc(dp->dev, type)) == 0)
kernel.asm:  ip->major = major;
kernel.asm:  ip->minor = minor;
kernel.asm:  ip->nlink = 1;
kernel.asm:  if(dirlink(dp, name, ip->inum) < 0)
kernel.asm:    dp->nlink++;  // for ".."
kernel.asm:    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
kernel.asm:  if(ip->type == T_DIR){
kernel.asm:  ip->nlink++;
kernel.asm:  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
kernel.asm:  ip->nlink--;
kernel.asm:  if(ip->nlink < 1)
kernel.asm:  if(ip->type == T_DIR && !isdirempty(ip)){
kernel.asm:  if(ip->type == T_DIR){
kernel.asm:  ip->nlink--;
kernel.asm:  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
kernel.asm:    dp->nlink--;
kernel.asm:    if(ip->type == T_DIR && omode != O_RDONLY){
kernel.asm:    if(ip->type == T_DIR && omode != O_RDONLY){
kernel.asm:  if(ip->type != T_DIR){
kernel.asm:		if(p->pid != UNUSED && p->pid == pid){
kernel.asm:			cprintf("ppid : %d\n", p->parent->pid);
kernel.asm:			cprintf("ppid : %d\n", p->parent->pid);
kernel.asm:		if(p->state != UNUSED)
kernel.asm:				maxpid = p->pid; 
kernel.asm:		if(p->state != UNUSED)
kernel.asm:			//cprintf("state %d, unused pid :%d\n", p->state, p->pid); 
kernel.asm:  if(p->kstack == 0)
kernel.asm:  if(p->pgdir == 0)
kernel.asm:  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
kernel.asm:  lcr3(V2P(p->pgdir));  // switch to process's address space
kill.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
kill.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
kill.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
kill.asm:  if(bp + bp->s.size == p->s.ptr){
kill.asm:    bp->s.size += p->s.ptr->s.size;
kill.asm:    bp->s.ptr = p->s.ptr->s.ptr;
kill.asm:    bp->s.ptr = p->s.ptr;
kill.asm:  if(p + p->s.size == bp){
kill.asm:    p->s.size += bp->s.size;
kill.asm:    p->s.ptr = bp->s.ptr;
kill.asm:    p->s.ptr = bp;
kill.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
kill.asm:    bp->s.size += p->s.ptr->s.size;
kill.asm:    bp->s.ptr = p->s.ptr->s.ptr;
kill.asm:  if(p + p->s.size == bp){
kill.asm:    p->s.size += bp->s.size;
kill.asm:    p->s.size += bp->s.size;
kill.asm:    p->s.ptr = bp->s.ptr;
kill.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
kill.asm:    if(p->s.size >= nunits){
kill.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
kill.asm:    if(p->s.size >= nunits){
kill.asm:        p->s.size = nunits;
kill.asm:  hp->s.size = nu;
kill.asm:      if(p->s.size == nunits)
kill.asm:        p->s.size -= nunits;
kill.asm:        p += p->s.size;
kill.asm:        p->s.size = nunits;
kill.asm:        prevp->s.ptr = p->s.ptr;
ln.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
ln.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
ln.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
ln.asm:  if(bp + bp->s.size == p->s.ptr){
ln.asm:    bp->s.size += p->s.ptr->s.size;
ln.asm:    bp->s.ptr = p->s.ptr->s.ptr;
ln.asm:    bp->s.ptr = p->s.ptr;
ln.asm:  if(p + p->s.size == bp){
ln.asm:    p->s.size += bp->s.size;
ln.asm:    p->s.ptr = bp->s.ptr;
ln.asm:    p->s.ptr = bp;
ln.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
ln.asm:    bp->s.size += p->s.ptr->s.size;
ln.asm:    bp->s.ptr = p->s.ptr->s.ptr;
ln.asm:  if(p + p->s.size == bp){
ln.asm:    p->s.size += bp->s.size;
ln.asm:    p->s.size += bp->s.size;
ln.asm:    p->s.ptr = bp->s.ptr;
ln.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
ln.asm:    if(p->s.size >= nunits){
ln.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
ln.asm:    if(p->s.size >= nunits){
ln.asm:        p->s.size = nunits;
ln.asm:  hp->s.size = nu;
ln.asm:      if(p->s.size == nunits)
ln.asm:        p->s.size -= nunits;
ln.asm:        p += p->s.size;
ln.asm:        p->s.size = nunits;
ln.asm:        prevp->s.ptr = p->s.ptr;
log.c://   modify bp->data[]
ls.asm:  for(p=path+strlen(path); p >= path && *p != '/'; p--)
ls.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
ls.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
ls.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
ls.asm:  if(bp + bp->s.size == p->s.ptr){
ls.asm:    bp->s.size += p->s.ptr->s.size;
ls.asm:    bp->s.ptr = p->s.ptr->s.ptr;
ls.asm:    bp->s.ptr = p->s.ptr;
ls.asm:  if(p + p->s.size == bp){
ls.asm:    p->s.size += bp->s.size;
ls.asm:    p->s.ptr = bp->s.ptr;
ls.asm:    p->s.ptr = bp;
ls.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
ls.asm:    bp->s.size += p->s.ptr->s.size;
ls.asm:    bp->s.ptr = p->s.ptr->s.ptr;
ls.asm:  if(p + p->s.size == bp){
ls.asm:    p->s.size += bp->s.size;
ls.asm:    p->s.size += bp->s.size;
ls.asm:    p->s.ptr = bp->s.ptr;
ls.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
ls.asm:    if(p->s.size >= nunits){
ls.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
ls.asm:    if(p->s.size >= nunits){
ls.asm:        p->s.size = nunits;
ls.asm:  hp->s.size = nu;
ls.asm:      if(p->s.size == nunits)
ls.asm:        p->s.size -= nunits;
ls.asm:        p += p->s.size;
ls.asm:        p->s.size = nunits;
ls.asm:        prevp->s.ptr = p->s.ptr;
ls.c:  for(p=path+strlen(path); p >= path && *p != '/'; p--)
mkdir.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
mkdir.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
mkdir.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
mkdir.asm:  if(bp + bp->s.size == p->s.ptr){
mkdir.asm:    bp->s.size += p->s.ptr->s.size;
mkdir.asm:    bp->s.ptr = p->s.ptr->s.ptr;
mkdir.asm:    bp->s.ptr = p->s.ptr;
mkdir.asm:  if(p + p->s.size == bp){
mkdir.asm:    p->s.size += bp->s.size;
mkdir.asm:    p->s.ptr = bp->s.ptr;
mkdir.asm:    p->s.ptr = bp;
mkdir.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
mkdir.asm:    bp->s.size += p->s.ptr->s.size;
mkdir.asm:    bp->s.ptr = p->s.ptr->s.ptr;
mkdir.asm:  if(p + p->s.size == bp){
mkdir.asm:    p->s.size += bp->s.size;
mkdir.asm:    p->s.size += bp->s.size;
mkdir.asm:    p->s.ptr = bp->s.ptr;
mkdir.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
mkdir.asm:    if(p->s.size >= nunits){
mkdir.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
mkdir.asm:    if(p->s.size >= nunits){
mkdir.asm:        p->s.size = nunits;
mkdir.asm:  hp->s.size = nu;
mkdir.asm:      if(p->s.size == nunits)
mkdir.asm:        p->s.size -= nunits;
mkdir.asm:        p += p->s.size;
mkdir.asm:        p->s.size = nunits;
mkdir.asm:        prevp->s.ptr = p->s.ptr;
mp.c:    if((mp = mpsearch1(p-1024, 1024)))
mp.c:  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
mp.c:  conf = (struct mpconf*) P2V((uint) mp->physaddr);
mp.c:  if(mp->imcrp){
pipe.c:  p->readopen = 1;
pipe.c:  p->writeopen = 1;
pipe.c:  p->nwrite = 0;
pipe.c:  p->nread = 0;
pipe.c:  initlock(&p->lock, "pipe");
pipe.c:  acquire(&p->lock);
pipe.c:    p->writeopen = 0;
pipe.c:    wakeup(&p->nread);
pipe.c:    p->readopen = 0;
pipe.c:    wakeup(&p->nwrite);
pipe.c:  if(p->readopen == 0 && p->writeopen == 0){
pipe.c:    release(&p->lock);
pipe.c:    release(&p->lock);
pipe.c:  acquire(&p->lock);
pipe.c:    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
pipe.c:      if(p->readopen == 0 || myproc()->killed){
pipe.c:        release(&p->lock);
pipe.c:      wakeup(&p->nread);
pipe.c:      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
pipe.c:    p->data[p->nwrite++ % PIPESIZE] = addr[i];
pipe.c:  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
pipe.c:  release(&p->lock);
pipe.c:  acquire(&p->lock);
pipe.c:  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
pipe.c:      release(&p->lock);
pipe.c:    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
pipe.c:    if(p->nread == p->nwrite)
pipe.c:    addr[i] = p->data[p->nread++ % PIPESIZE];
pipe.c:  wakeup(&p->nwrite);  //DOC: piperead-wakeup
pipe.c:  release(&p->lock);
proc.c:    if(p->state == UNUSED)
proc.c:  p->state = EMBRYO;
proc.c:  p->pid = nextpid++;
proc.c:  if((p->kstack = kalloc()) == 0){
proc.c:    p->state = UNUSED;
proc.c:  sp = p->kstack + KSTACKSIZE;
proc.c:  sp -= sizeof *p->tf;
proc.c:  p->tf = (struct trapframe*)sp;
proc.c:  sp -= sizeof *p->context;
proc.c:  p->context = (struct context*)sp;
proc.c:  memset(p->context, 0, sizeof *p->context);
proc.c:  p->context->eip = (uint)forkret;
proc.c:  if((p->pgdir = setupkvm()) == 0)
proc.c:  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
proc.c:  p->sz = PGSIZE;
proc.c:  memset(p->tf, 0, sizeof(*p->tf));
proc.c:  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
proc.c:  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
proc.c:  p->tf->es = p->tf->ds;
proc.c:  p->tf->ss = p->tf->ds;
proc.c:  p->tf->eflags = FL_IF;
proc.c:  p->tf->esp = PGSIZE;
proc.c:  p->tf->eip = 0;  // beginning of initcode.S
proc.c:  safestrcpy(p->name, "initcode", sizeof(p->name));
proc.c:  p->cwd = namei("/");
proc.c:  // this assignment to p->state lets other cores
proc.c:  p->state = RUNNABLE;
proc.c:  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
proc.c:    kfree(np->kstack);
proc.c:    np->kstack = 0;
proc.c:    np->state = UNUSED;
proc.c:  np->sz = curproc->sz;
proc.c:  np->parent = curproc;
proc.c:  *np->tf = *curproc->tf;
proc.c:  np->tf->eax = 0;
proc.c:      np->ofile[i] = filedup(curproc->ofile[i]);
proc.c:  np->cwd = idup(curproc->cwd);
proc.c:  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
proc.c:  pid = np->pid;
proc.c:  np->state = RUNNABLE;
proc.c:    if(p->parent == curproc){
proc.c:      p->parent = initproc;
proc.c:      if(p->state == ZOMBIE)
proc.c:      if(p->parent != curproc)
proc.c:      if(p->state == ZOMBIE){
proc.c:        pid = p->pid;
proc.c:        kfree(p->kstack);
proc.c:        p->kstack = 0;
proc.c:        freevm(p->pgdir);
proc.c:        p->pid = 0;
proc.c:        p->parent = 0;
proc.c:        p->name[0] = 0;
proc.c:        p->killed = 0;
proc.c:        p->state = UNUSED;
proc.c:      if(p->state != RUNNABLE)
proc.c:      p->state = RUNNING;
proc.c:      swtch(&(c->scheduler), p->context);
proc.c:      // It should have changed its p->state before coming back.
proc.c:  if(p->state == RUNNING)
proc.c:  swtch(&p->context, mycpu()->scheduler);
proc.c:  // change p->state and then call sched.
proc.c:  p->chan = chan;
proc.c:  p->state = SLEEPING;
proc.c:  p->chan = 0;
proc.c:    if(p->state == SLEEPING && p->chan == chan)
proc.c:      p->state = RUNNABLE;
proc.c:    if(p->pid == pid){
proc.c:      p->killed = 1;
proc.c:      if(p->state == SLEEPING)
proc.c:        p->state = RUNNABLE;
proc.c:    if(p->state == UNUSED)
proc.c:    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
proc.c:      state = states[p->state];
proc.c:    cprintf("%d %s %s", p->pid, state, p->name);
proc.c:    if(p->state == SLEEPING){
proc.c:      getcallerpcs((uint*)p->context->ebp+2, pc);
rm.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
rm.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
rm.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
rm.asm:  if(bp + bp->s.size == p->s.ptr){
rm.asm:    bp->s.size += p->s.ptr->s.size;
rm.asm:    bp->s.ptr = p->s.ptr->s.ptr;
rm.asm:    bp->s.ptr = p->s.ptr;
rm.asm:  if(p + p->s.size == bp){
rm.asm:    p->s.size += bp->s.size;
rm.asm:    p->s.ptr = bp->s.ptr;
rm.asm:    p->s.ptr = bp;
rm.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
rm.asm:    bp->s.size += p->s.ptr->s.size;
rm.asm:    bp->s.ptr = p->s.ptr->s.ptr;
rm.asm:  if(p + p->s.size == bp){
rm.asm:    p->s.size += bp->s.size;
rm.asm:    p->s.size += bp->s.size;
rm.asm:    p->s.ptr = bp->s.ptr;
rm.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
rm.asm:    if(p->s.size >= nunits){
rm.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
rm.asm:    if(p->s.size >= nunits){
rm.asm:        p->s.size = nunits;
rm.asm:  hp->s.size = nu;
rm.asm:      if(p->s.size == nunits)
rm.asm:        p->s.size -= nunits;
rm.asm:        p += p->s.size;
rm.asm:        p->s.size = nunits;
rm.asm:        prevp->s.ptr = p->s.ptr;
seqdec_prio.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
seqdec_prio.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
seqdec_prio.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
seqdec_prio.asm:  if(bp + bp->s.size == p->s.ptr){
seqdec_prio.asm:    bp->s.size += p->s.ptr->s.size;
seqdec_prio.asm:    bp->s.ptr = p->s.ptr->s.ptr;
seqdec_prio.asm:    bp->s.ptr = p->s.ptr;
seqdec_prio.asm:  if(p + p->s.size == bp){
seqdec_prio.asm:    p->s.size += bp->s.size;
seqdec_prio.asm:    p->s.ptr = bp->s.ptr;
seqdec_prio.asm:    p->s.ptr = bp;
seqdec_prio.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
seqdec_prio.asm:    bp->s.size += p->s.ptr->s.size;
seqdec_prio.asm:    bp->s.ptr = p->s.ptr->s.ptr;
seqdec_prio.asm:  if(p + p->s.size == bp){
seqdec_prio.asm:    p->s.size += bp->s.size;
seqdec_prio.asm:    p->s.size += bp->s.size;
seqdec_prio.asm:    p->s.ptr = bp->s.ptr;
seqdec_prio.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
seqdec_prio.asm:    if(p->s.size >= nunits){
seqdec_prio.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
seqdec_prio.asm:    if(p->s.size >= nunits){
seqdec_prio.asm:        p->s.size = nunits;
seqdec_prio.asm:  hp->s.size = nu;
seqdec_prio.asm:      if(p->s.size == nunits)
seqdec_prio.asm:        p->s.size -= nunits;
seqdec_prio.asm:        p += p->s.size;
seqdec_prio.asm:        p->s.size = nunits;
seqdec_prio.asm:        prevp->s.ptr = p->s.ptr;
seqinc_prio.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
seqinc_prio.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
seqinc_prio.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
seqinc_prio.asm:  if(bp + bp->s.size == p->s.ptr){
seqinc_prio.asm:    bp->s.size += p->s.ptr->s.size;
seqinc_prio.asm:    bp->s.ptr = p->s.ptr->s.ptr;
seqinc_prio.asm:    bp->s.ptr = p->s.ptr;
seqinc_prio.asm:  if(p + p->s.size == bp){
seqinc_prio.asm:    p->s.size += bp->s.size;
seqinc_prio.asm:    p->s.ptr = bp->s.ptr;
seqinc_prio.asm:    p->s.ptr = bp;
seqinc_prio.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
seqinc_prio.asm:    bp->s.size += p->s.ptr->s.size;
seqinc_prio.asm:    bp->s.ptr = p->s.ptr->s.ptr;
seqinc_prio.asm:  if(p + p->s.size == bp){
seqinc_prio.asm:    p->s.size += bp->s.size;
seqinc_prio.asm:    p->s.size += bp->s.size;
seqinc_prio.asm:    p->s.ptr = bp->s.ptr;
seqinc_prio.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
seqinc_prio.asm:    if(p->s.size >= nunits){
seqinc_prio.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
seqinc_prio.asm:    if(p->s.size >= nunits){
seqinc_prio.asm:        p->s.size = nunits;
seqinc_prio.asm:  hp->s.size = nu;
seqinc_prio.asm:      if(p->s.size == nunits)
seqinc_prio.asm:        p->s.size -= nunits;
seqinc_prio.asm:        p += p->s.size;
seqinc_prio.asm:        p->s.size = nunits;
seqinc_prio.asm:        prevp->s.ptr = p->s.ptr;
sh.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
sh.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
sh.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
sh.asm:  if(bp + bp->s.size == p->s.ptr){
sh.asm:    bp->s.size += p->s.ptr->s.size;
sh.asm:    bp->s.ptr = p->s.ptr->s.ptr;
sh.asm:    bp->s.ptr = p->s.ptr;
sh.asm:  if(p + p->s.size == bp){
sh.asm:    p->s.size += bp->s.size;
sh.asm:    p->s.ptr = bp->s.ptr;
sh.asm:    p->s.ptr = bp;
sh.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
sh.asm:    bp->s.size += p->s.ptr->s.size;
sh.asm:    bp->s.ptr = p->s.ptr->s.ptr;
sh.asm:  if(p + p->s.size == bp){
sh.asm:    p->s.size += bp->s.size;
sh.asm:    p->s.size += bp->s.size;
sh.asm:    p->s.ptr = bp->s.ptr;
sh.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
sh.asm:    if(p->s.size >= nunits){
sh.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
sh.asm:    if(p->s.size >= nunits){
sh.asm:        p->s.size = nunits;
sh.asm:  hp->s.size = nu;
sh.asm:      if(p->s.size == nunits)
sh.asm:        p->s.size -= nunits;
sh.asm:        p += p->s.size;
sh.asm:        p->s.size = nunits;
sh.asm:        prevp->s.ptr = p->s.ptr;
stressfs.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
stressfs.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
stressfs.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
stressfs.asm:  if(bp + bp->s.size == p->s.ptr){
stressfs.asm:    bp->s.size += p->s.ptr->s.size;
stressfs.asm:    bp->s.ptr = p->s.ptr->s.ptr;
stressfs.asm:    bp->s.ptr = p->s.ptr;
stressfs.asm:  if(p + p->s.size == bp){
stressfs.asm:    p->s.size += bp->s.size;
stressfs.asm:    p->s.ptr = bp->s.ptr;
stressfs.asm:    p->s.ptr = bp;
stressfs.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
stressfs.asm:    bp->s.size += p->s.ptr->s.size;
stressfs.asm:    bp->s.ptr = p->s.ptr->s.ptr;
stressfs.asm:  if(p + p->s.size == bp){
stressfs.asm:    p->s.size += bp->s.size;
stressfs.asm:    p->s.size += bp->s.size;
stressfs.asm:    p->s.ptr = bp->s.ptr;
stressfs.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
stressfs.asm:    if(p->s.size >= nunits){
stressfs.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
stressfs.asm:    if(p->s.size >= nunits){
stressfs.asm:        p->s.size = nunits;
stressfs.asm:  hp->s.size = nu;
stressfs.asm:      if(p->s.size == nunits)
stressfs.asm:        p->s.size -= nunits;
stressfs.asm:        p += p->s.size;
stressfs.asm:        p->s.size = nunits;
stressfs.asm:        prevp->s.ptr = p->s.ptr;
sysfile.c:  if(ip->type == T_DIR){
sysfile.c:  ip->nlink++;
sysfile.c:  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
sysfile.c:  ip->nlink--;
sysfile.c:  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
sysfile.c:  if(ip->nlink < 1)
sysfile.c:  if(ip->type == T_DIR && !isdirempty(ip)){
sysfile.c:  if(ip->type == T_DIR){
sysfile.c:    dp->nlink--;
sysfile.c:  ip->nlink--;
sysfile.c:    if(type == T_FILE && ip->type == T_FILE)
sysfile.c:  if((ip = ialloc(dp->dev, type)) == 0)
sysfile.c:  ip->major = major;
sysfile.c:  ip->minor = minor;
sysfile.c:  ip->nlink = 1;
sysfile.c:    dp->nlink++;  // for ".."
sysfile.c:    // No ip->nlink++ for ".": avoid cyclic ref count.
sysfile.c:    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
sysfile.c:  if(dirlink(dp, name, ip->inum) < 0)
sysfile.c:    if(ip->type == T_DIR && omode != O_RDONLY){
sysfile.c:  if(ip->type != T_DIR){
sysproc.c:		if(p->pid != UNUSED && p->pid == pid){
sysproc.c:			cprintf("ppid : %d\n", p->parent->pid);
sysproc.c:		if(p->state != UNUSED)
sysproc.c:			if(maxpid<p->pid)
sysproc.c:				maxpid = p->pid; 
sysproc.c:		if(p->state != UNUSED)
sysproc.c:			//cprintf("state %d, used pid :%d\n", p->state, p->pid); 
sysproc.c:			//cprintf("state %d, unused pid :%d\n", p->state, p->pid); 
umalloc.c:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
umalloc.c:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
umalloc.c:  if(bp + bp->s.size == p->s.ptr){
umalloc.c:    bp->s.size += p->s.ptr->s.size;
umalloc.c:    bp->s.ptr = p->s.ptr->s.ptr;
umalloc.c:    bp->s.ptr = p->s.ptr;
umalloc.c:  if(p + p->s.size == bp){
umalloc.c:    p->s.size += bp->s.size;
umalloc.c:    p->s.ptr = bp->s.ptr;
umalloc.c:    p->s.ptr = bp;
umalloc.c:  hp->s.size = nu;
umalloc.c:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
umalloc.c:    if(p->s.size >= nunits){
umalloc.c:      if(p->s.size == nunits)
umalloc.c:        prevp->s.ptr = p->s.ptr;
umalloc.c:        p->s.size -= nunits;
umalloc.c:        p += p->s.size;
umalloc.c:        p->s.size = nunits;
usertests.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
usertests.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
usertests.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
usertests.asm:  if(bp + bp->s.size == p->s.ptr){
usertests.asm:    bp->s.size += p->s.ptr->s.size;
usertests.asm:    bp->s.ptr = p->s.ptr->s.ptr;
usertests.asm:    bp->s.ptr = p->s.ptr;
usertests.asm:  if(p + p->s.size == bp){
usertests.asm:    p->s.size += bp->s.size;
usertests.asm:    p->s.ptr = bp->s.ptr;
usertests.asm:    p->s.ptr = bp;
usertests.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
usertests.asm:    bp->s.size += p->s.ptr->s.size;
usertests.asm:    bp->s.ptr = p->s.ptr->s.ptr;
usertests.asm:  if(p + p->s.size == bp){
usertests.asm:    p->s.size += bp->s.size;
usertests.asm:    p->s.size += bp->s.size;
usertests.asm:    p->s.ptr = bp->s.ptr;
usertests.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
usertests.asm:    if(p->s.size >= nunits){
usertests.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
usertests.asm:    if(p->s.size >= nunits){
usertests.asm:        p->s.size = nunits;
usertests.asm:  hp->s.size = nu;
usertests.asm:      if(p->s.size == nunits)
usertests.asm:        p->s.size -= nunits;
usertests.asm:        p += p->s.size;
usertests.asm:        p->s.size = nunits;
usertests.asm:        prevp->s.ptr = p->s.ptr;
usertests.c:// does chdir() call iput(p->cwd) in a transaction?
usertests.c:// does exit() call iput(p->cwd) in a transaction?
vm.c:  if(p->kstack == 0)
vm.c:  if(p->pgdir == 0)
vm.c:  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
vm.c:  lcr3(V2P(p->pgdir));  // switch to process's address space
wc.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
wc.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
wc.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
wc.asm:  if(bp + bp->s.size == p->s.ptr){
wc.asm:    bp->s.size += p->s.ptr->s.size;
wc.asm:    bp->s.ptr = p->s.ptr->s.ptr;
wc.asm:    bp->s.ptr = p->s.ptr;
wc.asm:  if(p + p->s.size == bp){
wc.asm:    p->s.size += bp->s.size;
wc.asm:    p->s.ptr = bp->s.ptr;
wc.asm:    p->s.ptr = bp;
wc.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
wc.asm:    bp->s.size += p->s.ptr->s.size;
wc.asm:    bp->s.ptr = p->s.ptr->s.ptr;
wc.asm:  if(p + p->s.size == bp){
wc.asm:    p->s.size += bp->s.size;
wc.asm:    p->s.size += bp->s.size;
wc.asm:    p->s.ptr = bp->s.ptr;
wc.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
wc.asm:    if(p->s.size >= nunits){
wc.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
wc.asm:    if(p->s.size >= nunits){
wc.asm:        p->s.size = nunits;
wc.asm:  hp->s.size = nu;
wc.asm:      if(p->s.size == nunits)
wc.asm:        p->s.size -= nunits;
wc.asm:        p += p->s.size;
wc.asm:        p->s.size = nunits;
wc.asm:        prevp->s.ptr = p->s.ptr;
zombie.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
zombie.asm:  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
zombie.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
zombie.asm:  if(bp + bp->s.size == p->s.ptr){
zombie.asm:    bp->s.size += p->s.ptr->s.size;
zombie.asm:    bp->s.ptr = p->s.ptr->s.ptr;
zombie.asm:    bp->s.ptr = p->s.ptr;
zombie.asm:  if(p + p->s.size == bp){
zombie.asm:    p->s.size += bp->s.size;
zombie.asm:    p->s.ptr = bp->s.ptr;
zombie.asm:    p->s.ptr = bp;
zombie.asm:    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
zombie.asm:    bp->s.size += p->s.ptr->s.size;
zombie.asm:    bp->s.ptr = p->s.ptr->s.ptr;
zombie.asm:  if(p + p->s.size == bp){
zombie.asm:    p->s.size += bp->s.size;
zombie.asm:    p->s.size += bp->s.size;
zombie.asm:    p->s.ptr = bp->s.ptr;
zombie.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
zombie.asm:    if(p->s.size >= nunits){
zombie.asm:  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
zombie.asm:    if(p->s.size >= nunits){
zombie.asm:        p->s.size = nunits;
zombie.asm:  hp->s.size = nu;
zombie.asm:      if(p->s.size == nunits)
zombie.asm:        p->s.size -= nunits;
zombie.asm:        p += p->s.size;
zombie.asm:        p->s.size = nunits;
zombie.asm:        prevp->s.ptr = p->s.ptr;
