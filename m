Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D49CC2D9B2A
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 16:36:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BBBCF420806;
	Mon, 14 Dec 2020 16:36:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C1B2F4207A3
	for <drbd-dev@lists.linbit.com>; Mon, 14 Dec 2020 16:36:32 +0100 (CET)
Received: by mail-ot1-f52.google.com with SMTP id y24so16089584otk.3
	for <drbd-dev@lists.linbit.com>; Mon, 14 Dec 2020 07:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Sl32FFLuttCCK0eYN7N2YgXNZbFltH735KbXY+Llhk8=;
	b=OCfzpyrGnAmq3GPI88zgYkl3nt6rwLj7DQvQUAslHtQEjHBJkiGtapCMn5SP6EMdOr
	fOiDYofKg9j5SP1E78w5IEO2p/Z7om0+/0zgl3NJkHU69L+nQn9J+js19CttussM66gP
	CNuO85JmcMVA7wcTmYictrh4gr1k/aFaZSVdG1OJ7/wHmBNGKZYgcCkKs5jGBLGER/xd
	3Xs4sBLSGHJvWiNQOgufLvZjZJ/sWyk9iWDg4wVOy2ahYzeIaw0a0YC7ysCUdn9yPUmR
	LxmPSOokf8IRu638RiSvydbfVGoD13APeDEqBJJbNHsaB6l7ChGITdtZiLlwh1laeAZs
	ibHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Sl32FFLuttCCK0eYN7N2YgXNZbFltH735KbXY+Llhk8=;
	b=m+OpoRKyke3fKouXAvqUPWgeSKt2trFI8++Zds1/ihAT7+u4EnFTdjZz8de4vP6Hij
	SIoMZC7iWyeR88ACJsXaIeA2OtrMJrgIRTnkFFILNmtCWH3dBcfHFnslOWKyiT9AkBii
	+WvJazi60M59TL+tkgq+ZPiQUNS8N04sCyjvxkeci2Hj6JXkdAg5KdLOPHqJD/65Kraf
	wBtEOYFj+2GQhMZ5dksLDfhcnt6e00flqI0VPk4OJ7vatKrJMnjW5NlPse+dlYdYL3Gm
	yf1LEcmj/nB9X5/4p0afuvtyKyb09l7w7Wh/z7vwd53f01s6B0QuM3ZTWrBoYseEeSw6
	kjKw==
X-Gm-Message-State: AOAM530Zywta9M0ik9MA7W8DtqtJBhUCwAABJKxxmmvYKQP7OOCXYEbK
	veDB2WrLOU/+z7uiMInuQhdy1KEMEI3ff9yrGwZS6/WmPgPj4w==
X-Google-Smtp-Source: ABdhPJza6AMG7uYfuxaXIoM00eI6IWnnMIrOvVJOjg5IEg9EiRgSb/xP4nKLB/hT55D2Kv221ml4pzipJhbxC+rnp4M=
X-Received: by 2002:a9d:5549:: with SMTP id h9mr19328556oti.230.1607960191316; 
	Mon, 14 Dec 2020 07:36:31 -0800 (PST)
MIME-Version: 1.0
From: Michael Labriola <michael.d.labriola@gmail.com>
Date: Mon, 14 Dec 2020 10:36:20 -0500
Message-ID: <CAOQxz3ztdjxt+7ock3q6+kMRgYAwY3h10K8xOY0hHrijt+MfcA@mail.gmail.com>
To: drbd-dev@lists.linbit.com
Subject: [Drbd-dev] problems connecting with mix of 9.0.26-rc3, 9.0.24-1,
	and 9.0.25-1
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9075748871302113683=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============9075748871302113683==
Content-Type: multipart/alternative; boundary="0000000000000435a905b66e686c"

--0000000000000435a905b66e686c
Content-Type: text/plain; charset="UTF-8"

I just tried upgrading 1 node of a 3 node cluster to 9.0.26-rc3 (w/ patches
for 5.10 kernel support).  The other two nodes are running 9.0.24-1 and
9.0.25-1.  The upgraded node comes up w/out any noticeable complaints, but
stays in Connecting forever.  Switching that node back to 9.0.25-1 connects
instantly.

On the 9.0.26-rc3 node I see the following kernel messages:

Dec 14 10:21:40 gimli kernel: drbd test1: Starting worker thread (from
drbdsetup [852])
Dec 14 10:21:40 gimli kernel: drbd test1 legolas: Starting sender thread
(from drbdsetup [878])
Dec 14 10:21:40 gimli kernel: drbd test1 boromir: Starting sender thread
(from drbdsetup [906])
Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: meta-data IO uses: blk-bio
Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: disk( Diskless ->
Attaching )
Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: Maximum number of peer
devices = 2
Dec 14 10:21:40 gimli kernel: drbd test1: Method to ensure write ordering:
drain
Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: drbd_bm_resize called
with capacity == 10485048
Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: resync bitmap:
bits=1310631 words=40958 pages=80
Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: size = 5120 MB (5242524
KB)
Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: size = 5120 MB (5242524
KB)
Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: recounting of set bits
took additional 0ms
Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: disk( Attaching ->
UpToDate )
Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: attached to current UUID:
4E68D1E7371B03E8
Dec 14 10:21:40 gimli kernel: drbd test1 legolas: conn( StandAlone ->
Unconnected )
Dec 14 10:21:40 gimli kernel: drbd test1 legolas: Starting receiver thread
(from drbd_w_test1 [853])
Dec 14 10:21:40 gimli kernel: drbd test1 legolas: conn( Unconnected ->
Connecting )
Dec 14 10:21:40 gimli kernel: drbd test1 boromir: conn( StandAlone ->
Unconnected )
Dec 14 10:21:40 gimli kernel: drbd test1 boromir: Starting receiver thread
(from drbd_w_test1 [853])
Dec 14 10:21:40 gimli kernel: drbd test1 boromir: conn( Unconnected ->
Connecting )
Dec 14 10:21:41 gimli kernel: drbd test1 boromir: Handshake to peer 2
successful: Agreed network protocol version 117
Dec 14 10:21:41 gimli kernel: drbd test1 boromir: Feature flags enabled on
protocol level: 0xf TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.
Dec 14 10:21:41 gimli kernel: drbd test1 boromir: Starting ack_recv thread
(from drbd_r_test1 [1059])
Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 boromir:
drbd_sync_handshake:
Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 boromir: self
4E68D1E7371B03E8:0000000000000000:09DEB39F8943FFBE:0000000000000000 bits:0
flags:20
Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 boromir: peer
4E68D1E7371B03E8:0000000000000000:53AEFD79E3271354:8B8B34C634B7A922 bits:0
flags:120
Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 boromir:
uuid_compare()=no-sync by rule 38
Dec 14 10:21:41 gimli kernel: drbd test1: Preparing cluster-wide state
change 2702145072 (0->2 499/146)
Dec 14 10:21:41 gimli kernel: drbd test1 legolas: Handshake to peer 1
successful: Agreed network protocol version 117
Dec 14 10:21:41 gimli kernel: drbd test1 legolas: Feature flags enabled on
protocol level: 0xf TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.
Dec 14 10:21:41 gimli kernel: drbd test1 legolas: Starting ack_recv thread
(from drbd_r_test1 [1056])
Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 legolas:
drbd_sync_handshake:
Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 legolas: self
4E68D1E7371B03E8:0000000000000000:09DEB39F8943FFBE:0000000000000000 bits:0
flags:20
Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 legolas: peer
4E68D1E7371B03E8:0000000000000000:893B794351326FE2:F8549503131EA576 bits:0
flags:120
Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 legolas:
uuid_compare()=no-sync by rule 38
Dec 14 10:22:11 gimli kernel: drbd test1: Aborting cluster-wide state
change 2702145072 (30131ms) rv = -23
Dec 14 10:22:11 gimli kernel: drbd test1: Preparing cluster-wide state
change 3732554560 (0->1 499/146)
Dec 14 10:22:41 gimli kernel: drbd test1: Aborting cluster-wide state
change 3732554560 (30187ms) rv = -23
Dec 14 10:23:13 gimli kernel: drbd test1: Preparing cluster-wide state
change 2057843657 (0->2 499/146)
Dec 14 10:23:13 gimli kernel: drbd test1: Aborting cluster-wide state
change 2057843657 (30272ms) rv = -23
Dec 14 10:23:15 gimli kernel: drbd test1: Preparing cluster-wide state
change 2843902071 (0->1 499/146)
Dec 14 10:23:45 gimli kernel: drbd test1: Aborting cluster-wide state
change 2843902071 (30208ms) rv = -23
Dec 14 10:24:17 gimli kernel: drbd test1: Preparing cluster-wide state
change 1126537323 (0->2 499/146)
Dec 14 10:24:17 gimli kernel: drbd test1: Aborting cluster-wide state
change 1126537323 (30208ms) rv = -23

On the other 2 nodes, I see variations of this:

Dec 14 10:21:41 legolas kernel: drbd test1 boromir: Preparing remote state
change 2702145072
Dec 14 10:21:41 legolas kernel: drbd test1 gimli: Handshake to peer 0
successful: Agreed network protocol version 117
Dec 14 10:21:41 legolas kernel: drbd test1 gimli: Feature flags enabled on
protocol level: 0xf TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.
Dec 14 10:21:41 legolas kernel: drbd test1 gimli: Starting ack_recv thread
(from drbd_r_test1 [1182])
Dec 14 10:21:41 legolas kernel: drbd test1/0 drbd1 gimli:
drbd_sync_handshake:
Dec 14 10:21:41 legolas kernel: drbd test1/0 drbd1 gimli: self
4E68D1E7371B03E8:0000000000000000:893B794351326FE2:F8549503131EA576 bits:0
flags:120
Dec 14 10:21:41 legolas kernel: drbd test1/0 drbd1 gimli: peer
4E68D1E7371B03E8:0000000000000000:09DEB39F8943FFBE:0000000000000000 bits:0
flags:20
Dec 14 10:21:41 legolas kernel: drbd test1/0 drbd1 gimli:
uuid_compare()=no-sync by rule 38
Dec 14 10:22:11 legolas kernel: drbd test1 boromir: Aborting remote state
change 2702145072
Dec 14 10:22:11 legolas kernel: drbd test1 gimli: Preparing remote state
change 3732554560
Dec 14 10:22:41 legolas kernel: drbd test1 gimli: Aborting remote state
change 3732554560
Dec 14 10:22:43 legolas kernel: drbd test1 boromir: Preparing remote state
change 2057843657
Dec 14 10:23:13 legolas kernel: drbd test1: Two-phase commit 2057843657
timeout
Dec 14 10:23:13 legolas kernel: drbd test1 boromir: Ignoring P_TWOPC_ABORT
packet 2057843657.
Dec 14 10:23:15 legolas kernel: drbd test1 gimli: Preparing remote state
change 2843902071
Dec 14 10:23:45 legolas kernel: drbd test1 gimli: Aborting remote state
change 2843902071
Dec 14 10:23:47 legolas kernel: drbd test1 boromir: Preparing remote state
change 1126537323
Dec 14 10:24:17 legolas kernel: drbd test1 boromir: Aborting remote state
change 1126537323

Anyone seeing this kind of thing with the latest rc?

-- 
Michael D Labriola
21 Rip Van Winkle Cir
Warwick, RI 02886
401-316-9844 (cell)

--0000000000000435a905b66e686c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif;font-size:small">I just tried upgrading 1 node of a 3 node cluster=
 to 9.0.26-rc3 (w/ patches for 5.10 kernel support).=C2=A0 The other two no=
des are running 9.0.24-1 and 9.0.25-1.=C2=A0 The upgraded node comes up w/o=
ut any noticeable complaints, but stays in Connecting forever.=C2=A0 Switch=
ing that node back to 9.0.25-1 connects instantly.<br></div><div class=3D"g=
mail_default" style=3D"font-family:arial,sans-serif;font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font=
-size:small">On the 9.0.26-rc3 node I see the following kernel messages:</d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-family:ari=
al,sans-serif;font-size:small">Dec 14 10:21:40 gimli kernel: drbd test1: St=
arting worker thread (from drbdsetup [852])<br>Dec 14 10:21:40 gimli kernel=
: drbd test1 legolas: Starting sender thread (from drbdsetup [878])<br>Dec =
14 10:21:40 gimli kernel: drbd test1 boromir: Starting sender thread (from =
drbdsetup [906])<br>Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: meta-=
data IO uses: blk-bio<br>Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: =
disk( Diskless -&gt; Attaching )<br>Dec 14 10:21:40 gimli kernel: drbd test=
1/0 drbd1: Maximum number of peer devices =3D 2<br>Dec 14 10:21:40 gimli ke=
rnel: drbd test1: Method to ensure write ordering: drain<br>Dec 14 10:21:40=
 gimli kernel: drbd test1/0 drbd1: drbd_bm_resize called with capacity =3D=
=3D 10485048<br>Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: resync bi=
tmap: bits=3D1310631 words=3D40958 pages=3D80<br>Dec 14 10:21:40 gimli kern=
el: drbd test1/0 drbd1: size =3D 5120 MB (5242524 KB)<br>Dec 14 10:21:40 gi=
mli kernel: drbd test1/0 drbd1: size =3D 5120 MB (5242524 KB)<br>Dec 14 10:=
21:40 gimli kernel: drbd test1/0 drbd1: recounting of set bits took additio=
nal 0ms<br>Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: disk( Attachin=
g -&gt; UpToDate )<br>Dec 14 10:21:40 gimli kernel: drbd test1/0 drbd1: att=
ached to current UUID: 4E68D1E7371B03E8<br>Dec 14 10:21:40 gimli kernel: dr=
bd test1 legolas: conn( StandAlone -&gt; Unconnected )<br>Dec 14 10:21:40 g=
imli kernel: drbd test1 legolas: Starting receiver thread (from drbd_w_test=
1 [853])<br>Dec 14 10:21:40 gimli kernel: drbd test1 legolas: conn( Unconne=
cted -&gt; Connecting )<br>Dec 14 10:21:40 gimli kernel: drbd test1 boromir=
: conn( StandAlone -&gt; Unconnected )<br>Dec 14 10:21:40 gimli kernel: drb=
d test1 boromir: Starting receiver thread (from drbd_w_test1 [853])<br>Dec =
14 10:21:40 gimli kernel: drbd test1 boromir: conn( Unconnected -&gt; Conne=
cting )<br>Dec 14 10:21:41 gimli kernel: drbd test1 boromir: Handshake to p=
eer 2 successful: Agreed network protocol version 117<br>Dec 14 10:21:41 gi=
mli kernel: drbd test1 boromir: Feature flags enabled on protocol level: 0x=
f TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.<br>Dec 14 10:21:41 gimli kernel=
: drbd test1 boromir: Starting ack_recv thread (from drbd_r_test1 [1059])<b=
r>Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 boromir: drbd_sync_hands=
hake:<br>Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 boromir: self 4E6=
8D1E7371B03E8:0000000000000000:09DEB39F8943FFBE:0000000000000000 bits:0 fla=
gs:20<br>Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 boromir: peer 4E6=
8D1E7371B03E8:0000000000000000:53AEFD79E3271354:8B8B34C634B7A922 bits:0 fla=
gs:120<br>Dec 14 10:21:41 gimli kernel: drbd test1/0 drbd1 boromir: uuid_co=
mpare()=3Dno-sync by rule 38<br>Dec 14 10:21:41 gimli kernel: drbd test1: P=
reparing cluster-wide state change 2702145072 (0-&gt;2 499/146)<br>Dec 14 1=
0:21:41 gimli kernel: drbd test1 legolas: Handshake to peer 1 successful: A=
greed network protocol version 117<br>Dec 14 10:21:41 gimli kernel: drbd te=
st1 legolas: Feature flags enabled on protocol level: 0xf TRIM THIN_RESYNC =
WRITE_SAME WRITE_ZEROES.<br>Dec 14 10:21:41 gimli kernel: drbd test1 legola=
s: Starting ack_recv thread (from drbd_r_test1 [1056])<br>Dec 14 10:21:41 g=
imli kernel: drbd test1/0 drbd1 legolas: drbd_sync_handshake:<br>Dec 14 10:=
21:41 gimli kernel: drbd test1/0 drbd1 legolas: self 4E68D1E7371B03E8:00000=
00000000000:09DEB39F8943FFBE:0000000000000000 bits:0 flags:20<br>Dec 14 10:=
21:41 gimli kernel: drbd test1/0 drbd1 legolas: peer 4E68D1E7371B03E8:00000=
00000000000:893B794351326FE2:F8549503131EA576 bits:0 flags:120<br>Dec 14 10=
:21:41 gimli kernel: drbd test1/0 drbd1 legolas: uuid_compare()=3Dno-sync b=
y rule 38<br>Dec 14 10:22:11 gimli kernel: drbd test1: Aborting cluster-wid=
e state change 2702145072 (30131ms) rv =3D -23<br>Dec 14 10:22:11 gimli ker=
nel: drbd test1: Preparing cluster-wide state change 3732554560 (0-&gt;1 49=
9/146)<br>Dec 14 10:22:41 gimli kernel: drbd test1: Aborting cluster-wide s=
tate change 3732554560 (30187ms) rv =3D -23<br>Dec 14 10:23:13 gimli kernel=
: drbd test1: Preparing cluster-wide state change 2057843657 (0-&gt;2 499/1=
46)<br>Dec 14 10:23:13 gimli kernel: drbd test1: Aborting cluster-wide stat=
e change 2057843657 (30272ms) rv =3D -23<br>Dec 14 10:23:15 gimli kernel: d=
rbd test1: Preparing cluster-wide state change 2843902071 (0-&gt;1 499/146)=
<br>Dec 14 10:23:45 gimli kernel: drbd test1: Aborting cluster-wide state c=
hange 2843902071 (30208ms) rv =3D -23<br>Dec 14 10:24:17 gimli kernel: drbd=
 test1: Preparing cluster-wide state change 1126537323 (0-&gt;2 499/146)<br=
>Dec 14 10:24:17 gimli kernel: drbd test1: Aborting cluster-wide state chan=
ge 1126537323 (30208ms) rv =3D -23<br></div><div class=3D"gmail_default" st=
yle=3D"font-family:arial,sans-serif;font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small">O=
n the other 2 nodes, I see variations of this:</div><div class=3D"gmail_def=
ault" style=3D"font-family:arial,sans-serif;font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:sm=
all">Dec 14 10:21:41 legolas kernel: drbd test1 boromir: Preparing remote s=
tate change 2702145072 <br>Dec 14 10:21:41 legolas kernel: drbd test1 gimli=
: Handshake to peer 0 successful: Agreed network protocol version 117<br>De=
c 14 10:21:41 legolas kernel: drbd test1 gimli: Feature flags enabled on pr=
otocol level: 0xf TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.<br>Dec 14 10:21=
:41 legolas kernel: drbd test1 gimli: Starting ack_recv thread (from drbd_r=
_test1 [1182])<br>Dec 14 10:21:41 legolas kernel: drbd test1/0 drbd1 gimli:=
 drbd_sync_handshake:<br>Dec 14 10:21:41 legolas kernel: drbd test1/0 drbd1=
 gimli: self 4E68D1E7371B03E8:0000000000000000:893B794351326FE2:F8549503131=
EA576 bits:0 flags:120<br>Dec 14 10:21:41 legolas kernel: drbd test1/0 drbd=
1 gimli: peer 4E68D1E7371B03E8:0000000000000000:09DEB39F8943FFBE:0000000000=
000000 bits:0 flags:20<br>Dec 14 10:21:41 legolas kernel: drbd test1/0 drbd=
1 gimli: uuid_compare()=3Dno-sync by rule 38<br>Dec 14 10:22:11 legolas ker=
nel: drbd test1 boromir: Aborting remote state change 2702145072<br>Dec 14 =
10:22:11 legolas kernel: drbd test1 gimli: Preparing remote state change 37=
32554560 <br>Dec 14 10:22:41 legolas kernel: drbd test1 gimli: Aborting rem=
ote state change 3732554560<br>Dec 14 10:22:43 legolas kernel: drbd test1 b=
oromir: Preparing remote state change 2057843657 <br>Dec 14 10:23:13 legola=
s kernel: drbd test1: Two-phase commit 2057843657 timeout<br>Dec 14 10:23:1=
3 legolas kernel: drbd test1 boromir: Ignoring P_TWOPC_ABORT packet 2057843=
657.<br>Dec 14 10:23:15 legolas kernel: drbd test1 gimli: Preparing remote =
state change 2843902071 <br>Dec 14 10:23:45 legolas kernel: drbd test1 giml=
i: Aborting remote state change 2843902071<br>Dec 14 10:23:47 legolas kerne=
l: drbd test1 boromir: Preparing remote state change 1126537323 <br>Dec 14 =
10:24:17 legolas kernel: drbd test1 boromir: Aborting remote state change 1=
126537323<br></div><div class=3D"gmail_default" style=3D"font-family:arial,=
sans-serif;font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-family:arial,sans-serif;font-size:small">Anyone seeing this kind of t=
hing with the latest rc?<br clear=3D"all"></div><br>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Michael D Labriola<br>21 Rip Van Winkle Cir<br>Warwick, RI 02886<br>401=
-316-9844 (cell)<br></div></div></div>

--0000000000000435a905b66e686c--

--===============9075748871302113683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============9075748871302113683==--
