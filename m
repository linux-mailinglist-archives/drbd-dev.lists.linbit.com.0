Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBF202102
	for <lists+drbd-dev@lfdr.de>; Sat, 20 Jun 2020 05:36:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3F699420422;
	Sat, 20 Jun 2020 05:36:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CFD304203F7
	for <drbd-dev@lists.linbit.com>; Sat, 20 Jun 2020 05:30:26 +0200 (CEST)
Received: by mail-pj1-f68.google.com with SMTP id m2so5292287pjv.2
	for <drbd-dev@lists.linbit.com>; Fri, 19 Jun 2020 20:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=I53/n5ydJ9yzbnxtmoDriMZB814XLzfic4sznaesD40=;
	b=Rutn4YPkcmqXLdEaPjRwH0N9ohbI/CzpH9cf5y9vG4nYpAw1nQr5aBkVvJ5iC9ui6q
	cLu5pHW/44+v6JlX39sxqMfNukxEy6S08EOmpnYgt90MBK4lvmz1Qm66oVfcHJZShxiQ
	h7SFiaUV2yA5KII9Om+c9u+JdAg6xNa2K9JLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I53/n5ydJ9yzbnxtmoDriMZB814XLzfic4sznaesD40=;
	b=oZR2+YCzHoQH47dhaXLb5QQIYPbSh8lDh3T6ZsnXQnxj8yMR3ycwRAVXng+cwyxtar
	lB3d8IjYyU7b0UQ/scjLQ1lrEH87q3WQejGscXIZHVn5vL9wjPutQVlDiKlgAz06tVmA
	Afw3fCnP+PIDPy0EhjBY5qOWPKDAOGi3ZmmDl6ZnrHJ//yN/r6/lPH1kcjE763sGZvMd
	58CKb/M/Gmfg2XaFO0Qoy4x1RikMEcEiHQux/+8A9gWJou5G+1J2NIt2xmx01b1txdTT
	YaX1oZnhAO/OlnVS6LCkkYmZfw2c0WlzxOVsYI9CDF8EEkLGOjJq4GlBPruTeC+E7REY
	Kw4A==
X-Gm-Message-State: AOAM530kHRxnJpXPc2tJMKeyqbfaW4JXgtZT7AXthxIIlgytwW3fWZYy
	hCr7TLij4IekzNKpMB3gzJv4lg==
X-Google-Smtp-Source: ABdhPJzDpg8kRLeVgrehMBlr+1UwoiUH6XXfWvLx404+vNnybEp9T2mmhskRjq6n4U4EQRsEK9B3AQ==
X-Received: by 2002:a17:902:ff06:: with SMTP id
	f6mr10351618plj.22.1592623826055; 
	Fri, 19 Jun 2020 20:30:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id 17sm7373750pfn.19.2020.06.19.20.30.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 20:30:03 -0700
Message-Id: <20200620033007.1444705-13-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Cc: Andy Whitcroft <apw@canonical.com>, linux-wireless@vger.kernel.org,
	x86@kernel.org, Kees Cook <keescook@chromium.org>,
	Jason Yan <yanaijie@huawei.com>, netdev@vger.kernel.org,
	Chao Yu <yuchao0@huawei.com>, linux-doc@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	clang-built-linux@googlegroups.com, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, linux-ide@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 12/16] f2fs: Eliminate usage of
	uninitialized_var() macro
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

From: Jason Yan <yanaijie@huawei.com>

This is an effort to eliminate the uninitialized_var() macro[1].

The use of this macro is the wrong solution because it forces off ANY
analysis by the compiler for a given variable. It even masks "unused
variable" warnings.

Quoted from Linus[2]:

"It's a horrible thing to use, in that it adds extra cruft to the
source code, and then shuts up a compiler warning (even the _reliable_
warnings from gcc)."

Fix it by remove this variable since it is not needed at all.

[1] https://github.com/KSPP/linux/issues/81
[2] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Suggested-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Link: https://lore.kernel.org/r/20200615085132.166470-1-yanaijie@huawei.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/f2fs/data.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 326c63879ddc..3753ba06531b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2856,7 +2856,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	};
 #endif
 	int nr_pages;
-	pgoff_t uninitialized_var(writeback_index);
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	pgoff_t done_index;
@@ -2875,8 +2874,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		clear_inode_flag(mapping->host, FI_HOT_DATA);
 
 	if (wbc->range_cyclic) {
-		writeback_index = mapping->writeback_index; /* prev offset */
-		index = writeback_index;
+		index = mapping->writeback_index; /* prev offset */
 		end = -1;
 	} else {
 		index = wbc->range_start >> PAGE_SHIFT;
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
