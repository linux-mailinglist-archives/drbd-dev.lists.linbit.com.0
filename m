Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4716617A600
	for <lists+drbd-dev@lfdr.de>; Thu,  5 Mar 2020 14:06:49 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D0A84203EE;
	Thu,  5 Mar 2020 14:06:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 531 seconds by postgrey-1.31 at mail19;
	Wed, 05 Feb 2020 12:16:50 CET
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ECF4C420318
	for <drbd-dev@lists.linbit.com>; Wed,  5 Feb 2020 12:16:50 +0100 (CET)
Received: by mail-oi1-f193.google.com with SMTP id c16so360994oic.3
	for <drbd-dev@lists.linbit.com>; Wed, 05 Feb 2020 03:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=VNJ8knBF9eM9SRZMrLdSviLoF4qCJ9zJKRufIGZFRNo=;
	b=NGyIOGDLD5lCuVBJqBu7AoYkfgHV6r2EnJZfMhImSfThg4pSEITaGoWroihKTgCsgL
	kVa1X3Fk2T5oMRvQmMiiTGyPgz7P4QW5uO1O2KbmIjOBtbvjqyYOoREOqwxvRb9nd6EK
	6noweidjI13TDCtI0WoXklJnkwAFrVe33SnWQoNkSacGfQulUx558uej+0TEFti2jXGU
	5ubfW2cUrHlpwL0zuLEyqjWFBjZDizMYhnA9V/siEFZBvsmK6/rIBsnqPOHOvjgpeBCu
	+6oRYbGC++AH9nSt7B/lFvoJoTrR76phAaLdXwWi+XW5e8r2xjiywwWiA8ozzPl9KrxW
	4AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=VNJ8knBF9eM9SRZMrLdSviLoF4qCJ9zJKRufIGZFRNo=;
	b=lGYWPQW2yzNDO/vVY9Ws09s9+fa2eTUj2v7/Db4nruDQSVbPUl951Buj2V7f9HDIQK
	+coqN/THYOdDSYDvMYMkJHydpRLXF43aU0R+eumpAICr9CSh7xoQ7QZ8ao63oR4uGQln
	NI6KAha8uq9gysIQ1XjqS8GBlCxPKnSJNTPsMXRl/qcrjSKIvVxvIgPy9nRCuc33mc3O
	VwxDbFhjDxvCxyshjAQy1fNHNdm7WAJHFMQDdna8H/5UnJz0pYmXMVu9yRNfz48vng2b
	INaZTm18f01mGxbQBp210ILKZP/9OsZ1lBEfQqnprc7ztYAjdG25oGGHbZ6d0eUdr0Rp
	EkqA==
X-Gm-Message-State: APjAAAXEX60HVxp9qHYYV4R1QeDuKg/cVI2SQvTHMzaVxDnfa++Mg/X0
	ApLsu3w9IWakrzhJbAmDrysn8fXPIJ7HQ2xC+SZq0ToR
X-Google-Smtp-Source: APXvYqw7ahZhZMRQDbsRa1gljFaV/6guEC4PZD4vB96OD9Tbk5uenyZPQ7n8tX8MhqLRev9J7H68E/DK4i22ciJAcLk=
X-Received: by 2002:aca:f517:: with SMTP id t23mr2362226oih.160.1580900818234; 
	Wed, 05 Feb 2020 03:06:58 -0800 (PST)
MIME-Version: 1.0
From: Dongsheng Yang <dongsheng081251@gmail.com>
Date: Wed, 5 Feb 2020 19:06:46 +0800
Message-ID: <CA+qeAOqyL5fDoFUXxVD0iaYSpY9P1qNH0Hd7eUUyGCg6hznKRQ@mail.gmail.com>
To: joel.colledge@linbit.com
X-Mailman-Approved-At: Thu, 05 Mar 2020 14:06:47 +0100
Cc: duan.zhang@easystack.cn, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] Bug Report : meet an unexcepted WFBitMapS status after
	restarting the primary
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
Content-Type: multipart/mixed; boundary="===============1775291240598594436=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============1775291240598594436==
Content-Type: multipart/alternative; boundary="000000000000b2312d059dd2276b"

--000000000000b2312d059dd2276b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi guys,

Version: drbd-9.0.21-1

Layout: drbd.res within 3 nodes -- node-1(Secondary), node-2(Primary),
node-3(Secondary)

Description:
a.reboot node-2 when cluster is working.
b.re-up the drbd.res on node-2 after it restarted.
c.an expected resync from node-3 to node-2 happens. When the resync is
done, however,
  node-1 raises an unexpected WFBitMapS repl status and can't recover to
normal anymore.

Status output:

node-1: drbdadm status

drbd6 role:Secondary

disk:UpToDate

hotspare connection:Connecting

node-2 role:Primary

replication:WFBitMapS peer-disk:Consistent

node-3 role:Secondary

peer-disk:UpToDate


node-2: drbdadm status

drbd6 role:Primary

disk:UpToDate

hotspare connection:Connecting

node-1 role:Secondary

peer-disk:UpToDate

node-3 role:Secondary

peer-disk:UpToDate

I assume that there is a process sequence below according to my source code
version:
node-1                                           node-2
                                       node-3
        restarted with CRASHED_PRIMARY
        start sync with node-3 as target
 start sync with node-2 as source
        =E2=80=A6                                                          =
      =E2=80=A6
                                                 end sync with node-3
                                       end sync with node-2
        w_after_state_change
                      loop 1 within for loop against node-1:(a)
receive_uuids10                                  send uuid with
UUID_FLAG_GOT_STABLE&CRASHED_PRIMARY to node-1
receive uuid of node-2 with CRASHED_PRIMARY      loop 2 within for loop
against node-3:
        clear  CRASHED_PRIMARY(b)
send uuid to node-2 with UUID_FLAG_RESYNC        receive uuids10
sync_handshake to SYNC_SOURCE_IF_BOTH_FAILED     sync_handshake to NO_SYNC
change repl state to WFBitMapS

The key problem is about the order of step(a) and step(b), that is, node-2
sends the
unexpected  CRASHED_PRIMARY to node-1 though it's actually no longer a
crashed primary
after syncing with node-3.
So may I have the below questions:
a.Is this really a BUG or just an expected result?
b.If there's already a patch fix within the newest verion?
c.If there's some workaround method against this kind of unexcepted status,
since I really
  meet so many other problems like that :(

--000000000000b2312d059dd2276b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi guys,</div><div><br></div>Version: drbd-9.0.21-1<b=
r><br>Layout: drbd.res within 3 nodes -- node-1(Secondary), node-2(Primary)=
, node-3(Secondary)<br><br>Description: <br>a.reboot node-2 when cluster is=
 working.<br>b.re-up the drbd.res on node-2 after it restarted.<br><a href=
=3D"http://c.an">c.an</a> expected resync from node-3 to node-2 happens. Wh=
en the resync is done, however,<br>=C2=A0 node-1 raises an unexpected WFBit=
MapS repl status and can&#39;t recover to normal anymore.<br><br>Status out=
put:<br><br>node-1: drbdadm status<br><br>drbd6 role:Secondary<br><br>disk:=
UpToDate<br><br>hotspare connection:Connecting<br><br>node-2 role:Primary<b=
r><br>replication:WFBitMapS peer-disk:Consistent<br><br>node-3 role:Seconda=
ry<br><br>peer-disk:UpToDate<br><br><br>node-2: drbdadm status<br><br>drbd6=
 role:Primary<br><br>disk:UpToDate<br><br>hotspare connection:Connecting<br=
><br>node-1 role:Secondary<br><br>peer-disk:UpToDate<br><br>node-3 role:Sec=
ondary<br><br>peer-disk:UpToDate<br><br>I assume that there is a process se=
quence below according to my source code version:<br>node-1 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node-2 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-3<br>					 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 restarted with CRASHED_PRIMARY =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>					 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start=
 sync with node-3 as target =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
art sync with node-2 as source<br>					 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=80=
=A6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E2=80=A6<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end sync with node-3 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0end sync with node-2<br>					 =C2=A0 =C2=A0 =C2=A0 =C2=A0 w_after_sta=
te_change<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0				 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 loop 1 within for loop against node-1:(a)<br>receive_u=
uids10 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0send uuid with UUID_FLA=
G_GOT_STABLE&amp;CRASHED_PRIMARY to node-1<br>receive uuid of node-2 with C=
RASHED_PRIMARY =C2=A0 =C2=A0 =C2=A0loop 2 within for loop against node-3:<b=
r>					 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear =C2=A0CRASHED_PRIMARY(b)<br>send =
uuid to node-2 with UUID_FLAG_RESYNC =C2=A0 =C2=A0 =C2=A0 =C2=A0receive uui=
ds10<br>sync_handshake to SYNC_SOURCE_IF_BOTH_FAILED =C2=A0 =C2=A0 sync_han=
dshake to NO_SYNC<br>change repl state to WFBitMapS<br><br>The key problem =
is about the order of step(a) and step(b), that is, node-2 sends the<br>une=
xpected =C2=A0CRASHED_PRIMARY to node-1 though it&#39;s actually no longer =
a crashed primary<br>after syncing with node-3.<br>So may I have the below =
questions:<br>a.Is this really a BUG or just an expected result?<br>b.If th=
ere&#39;s already a patch fix within the newest verion?<br>c.If there&#39;s=
 some workaround method against this kind of unexcepted status, since I rea=
lly<br>=C2=A0 meet so many other problems like that :(=C2=A0<br></div>

--000000000000b2312d059dd2276b--

--===============1775291240598594436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============1775291240598594436==--
