Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF84AD16C
	for <lists+drbd-dev@lfdr.de>; Tue,  8 Feb 2022 07:19:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9F3A84202C4;
	Tue,  8 Feb 2022 07:19:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 915654205F5
	for <drbd-dev@lists.linbit.com>; Tue,  8 Feb 2022 00:54:46 +0100 (CET)
Received: by mail-io1-f54.google.com with SMTP id d188so19089834iof.7
	for <drbd-dev@lists.linbit.com>; Mon, 07 Feb 2022 15:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IsFG5/GvZCP7d6Q7fgcMRKXpI72aUAEHst1zGwkjpaw=;
	b=Ttmc6V889RmJ6MHAGUJtazmXijIa85n3LlNxupw3lelmko7Xng3pDOFVybhEpsG35n
	8eEmXbgeqYzvp7n83Y8J2m/Zcklhm/ey9Cpj+PHrOUD6qhvBjd3E4Wq/OogBqZk2k8Aa
	txj0Wd9LNQanpICfBvecoBB7NpS5RSDwWr7G972OZVZynLwy06wLHYb6NJOjgS0tNb6h
	3+1Y8aFO0Hd/UrTC1tJGVe0toX542zxMEVLMNdX2eCXPcCzHMxbUOJleTAqGQJgORAPN
	Z60YJFTYrk8Xo+ZZNaXiZ4ar5YajGVyxg1bbgIx2KfHG6vEzEgMdoUcoO/zx8AVMsezj
	+U9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IsFG5/GvZCP7d6Q7fgcMRKXpI72aUAEHst1zGwkjpaw=;
	b=6DnF5UGK0OZy1vNlSp8p+dsFTL9g7Y9A+LCXPV2KdihKGiZq9J88zpmM+RI+7wQwxx
	nj6q+x/0S6WqIV758Yn9Xu0rVei2MG4wJdZH+w6Fqm5a3KBWZfzrdClhqAzjJes+nuG5
	0Y7XTaMp9Y6cBc75FdByvwT9a1c12RnlWz5FrX8qZt+o4Kg7jBz7ecIJeZiBIhz/LZSs
	hmQJGWs1ZmXSh0wx0QsoslubgZWsf6z1YgPbuSRzq07eHO6vqEADwaHf/Qh3b+RvxUtD
	Kf/89OqtGlgDmL6GgX66QKpJt5/fV/09IZb5VFSFdqXgTEZCp6doMC0GddMnbgcCs+bM
	+rRQ==
X-Gm-Message-State: AOAM532i0darkV/L3VcsMhoG8I/ImYoTyjYeLjTSSs02fFihNc2FuD+L
	ccrKnwMeGo8F9jiuOGtshpA=
X-Google-Smtp-Source: ABdhPJxXRaSZjvMa7wV2I843eAN5giCRrPzED7V6mf7qaX885XlsWgHillQURNcqTg9lrfh8ROfE9w==
X-Received: by 2002:a05:6638:10ea:: with SMTP id
	g10mr959591jae.79.1644278085342; 
	Mon, 07 Feb 2022 15:54:45 -0800 (PST)
Received: from localhost.localdomain (c-174-52-171-58.hsd1.ut.comcast.net.
	[174.52.171.58]) by smtp.gmail.com with ESMTPSA id
	w10sm6948815iow.44.2022.02.07.15.54.44
	(version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
	Mon, 07 Feb 2022 15:54:45 -0800 (PST)
From: Ethan Dye <mrtops03@gmail.com>
To: 
Date: Mon,  7 Feb 2022 16:54:42 -0700
Message-Id: <20220207235442.95090-1-mrtops03@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Feb 2022 07:19:25 +0100
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com, Nitin Gupta <ngupta@vflare.org>,
	Ethan Dye <mrtops03@gmail.com>
Subject: [Drbd-dev] [PATCH] block/zram: Fix wording in optional feature docs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

This fixes some simple grammar errors in the documentation for zram,
specifically errors in the optional featue section of the zram
documentation.

Signed-off-by: Ethan Dye <mrtops03@gmail.com>
---
 Documentation/admin-guide/blockdev/zram.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 3e11926a4df9..54fe63745ed8 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -315,8 +315,8 @@ To use the feature, admin should set up backing device via::
 
 	echo /dev/sda5 > /sys/block/zramX/backing_dev
 
-before disksize setting. It supports only partition at this moment.
-If admin wants to use incompressible page writeback, they could do via::
+before disksize setting. It supports only partitions at this moment.
+If admin wants to use incompressible page writeback, they could do it via::
 
 	echo huge > /sys/block/zramX/writeback
 
@@ -341,9 +341,9 @@ Admin can request writeback of those idle pages at right timing via::
 
 	echo idle > /sys/block/zramX/writeback
 
-With the command, zram writeback idle pages from memory to the storage.
+With the command, zram will writeback idle pages from memory to the storage.
 
-If admin want to write a specific page in zram device to backing device,
+If an admin wants to write a specific page in zram device to the backing device,
 they could write a page index into the interface.
 
 	echo "page_index=1251" > /sys/block/zramX/writeback
@@ -354,7 +354,7 @@ to guarantee storage health for entire product life.
 
 To overcome the concern, zram supports "writeback_limit" feature.
 The "writeback_limit_enable"'s default value is 0 so that it doesn't limit
-any writeback. IOW, if admin wants to apply writeback budget, he should
+any writeback. IOW, if admin wants to apply writeback budget, they should
 enable writeback_limit_enable via::
 
 	$ echo 1 > /sys/block/zramX/writeback_limit_enable
@@ -365,7 +365,7 @@ until admin sets the budget via /sys/block/zramX/writeback_limit.
 (If admin doesn't enable writeback_limit_enable, writeback_limit's value
 assigned via /sys/block/zramX/writeback_limit is meaningless.)
 
-If admin want to limit writeback as per-day 400M, he could do it
+If admin wants to limit writeback as per-day 400M, they could do it
 like below::
 
 	$ MB_SHIFT=20
@@ -375,16 +375,16 @@ like below::
 	$ echo 1 > /sys/block/zram0/writeback_limit_enable
 
 If admins want to allow further write again once the budget is exhausted,
-he could do it like below::
+they could do it like below::
 
 	$ echo $((400<<MB_SHIFT>>4K_SHIFT)) > \
 		/sys/block/zram0/writeback_limit
 
-If admin wants to see remaining writeback budget since last set::
+If an admin wants to see the remaining writeback budget since last set::
 
 	$ cat /sys/block/zramX/writeback_limit
 
-If admin want to disable writeback limit, he could do::
+If an admin wants to disable writeback limit, they could do::
 
 	$ echo 0 > /sys/block/zramX/writeback_limit_enable
 
@@ -393,7 +393,7 @@ system reboot, echo 1 > /sys/block/zramX/reset) so keeping how many of
 writeback happened until you reset the zram to allocate extra writeback
 budget in next setting is user's job.
 
-If admin wants to measure writeback count in a certain period, he could
+If admin wants to measure writeback count in a certain period, they could
 know it via /sys/block/zram0/bd_stat's 3rd column.
 
 memory tracking
-- 
2.32.0 (Apple Git-132)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
