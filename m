Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH+oD8bJumm6bwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:50:30 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 109B32BE9AF
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:50:29 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EDF5E1630DE;
	Wed, 18 Mar 2026 16:49:52 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
	[209.85.128.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9B0C91622B5
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 00:23:21 +0100 (CET)
Received: by mail-yw1-f180.google.com with SMTP id
	00721157ae682-79a610a32a6so19393667b3.0
	for <drbd-dev@lists.linbit.com>; Tue, 17 Mar 2026 16:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1773789800; x=1774394600;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=9xryH9h98FYSTs+igdpf8Vohpee7TsL/bp6sM3tzi4o=;
	b=SI2O9cQb3hzZrHU8qMWGAkdMRCr4y7pne4rgsnaWGVBcbLATSCVglQ/cDXWdudj9lO
	J6WHvUoAJcQ+70uOU9mkthw4thJc9VwJOnMkf9xGDW5A6zl4Bswaki2vwogLmolG3ZL6
	H+4X7/dLtxT5bLOnAmjJi5qWrlpt2LEVHujJLQg2JikJi1Tq9XWLJ8eEhqA6iJgUa2cM
	YSxr+sTs4ZzoT1pd0vXWEmCnDC+0slirZFmOrlMq19aoFRQdS92AgC+5OPinyGcTPb9M
	cfioU92EQc3x0ZVa623DjojY19KZyKBwc9FXCkcUg5WdG8z2gl9OQiRNY1rRP623NBGV
	hRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773789800; x=1774394600;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=9xryH9h98FYSTs+igdpf8Vohpee7TsL/bp6sM3tzi4o=;
	b=CeTZEMWH1MHtvFuXe+pg4HZOewCsZmHHHH6jfP8rfWhSiK2Xf10jH/HrSPmSrm4UGw
	mafPQ+vQssxUwoY2ubUiBkeHq5VG06ttqo0zPaw+lIdS1Y0x6JDtL7IFRRVE4F9Onqth
	5Kq6X3MvRbzIH7EgTyyw6zgUzwF7LqU3JFVZFdZeit9jd8qoQ0w5Ca1ks86NxOj32kDI
	BBoFC/oJ2OaXlDKPj2ozhxPWY7iyNQeYfNGLXWrYjMw7zblHjxh1RbkqADQg6KYnpbFQ
	sz511QlUKS+W8J/BdHzsu6ng6Zn3rVaFHDcop1pNFb6yEpyl46TvdyBsQuv20Qqac9b0
	O+5A==
X-Gm-Message-State: AOJu0YwQy2rVREOoeB/bhiT9Ks56VRV7+yBmzGHV7v94LXtTVwbYVC/7
	f6kSlVZYlPktGm7i/WQrdBR9Gbzvg2BpF2PJRlFnFq3A2RgaGJy0U/DY63Dqpcf+
X-Gm-Gg: ATEYQzxvnYSyMPNTS5WXs41a5WIueHwIz6V+qkmuQQmswQxa0oSUnxdUlVGjDVJd3cf
	ZxbNMb4ThbngYK6W5HO+YVA31izXzhH5PU0uhYt701mwGO7WaBW6jATpfO3DAt0cDZkkDafBOH2
	O5/UpYzppuaAzBvtpR79HVBzBHNMgW0SyL/0b6n8dWGDYzZ6xcJgvKQAPa3VZOFTaesAu/yzYoW
	YuRb5gnhDBDNpzb7VcyZ5iKyHh0IKsn4kT57OnmT/9xSByJyRTvRurK07WPL7MOzAZPQsvz5Var
	PIdkMObBVO+UWE825iff+NwltSOe2oo40AC4ncU4i669JaDhNxyKii8oc7J6LlJnNgQlD6NiNr4
	Iurakey0dzTd98D4bBHcdpWc+24YSYFCFUpxwPh7tGI71CNgQceDUnBQ/UlA8ivn8XfZ4fN0ZeW
	VsX268og38c8SRGdKGUA75HzIYv+CxwLmdjVcxFs9r7Eb2Qe7idMSxpbro9V293xXcIxRWmI3xo
	aXmunh11rZMF1gjnkRSUBhM
X-Received: by 2002:a05:690c:4b85:b0:79a:4f48:ee20 with SMTP id
	00721157ae682-79a71ee1ff9mr14353027b3.62.1773789800597; 
	Tue, 17 Mar 2026 16:23:20 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::f769])
	by smtp.gmail.com with ESMTPSA id
	00721157ae682-79a715d221dsm6858217b3.37.2026.03.17.16.23.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2026 16:23:20 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 0/4] drbd: A few bug fixes
Date: Tue, 17 Mar 2026 18:23:14 -0500
Message-ID: <20260317232318.18923-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Mar 2026 16:49:43 +0100
Cc: linux-block@vger.kernel.org, Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Spamd-Result: default: False [2.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,drbd-dev-bounces@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.189];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:ethantidmore06@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.linbit.com];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 109B32BE9AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Here are 4 bug fixes found with Smatch.

Ethan Tidmore (4):
  drbd: Fix out-of-bounds access
  drbd: Fix variable dereference before check
  drbd: Add missing error code in drbd_main.c
  drbd: Add check for error pointer

 drivers/block/drbd/drbd_main.c     | 1 +
 drivers/block/drbd/drbd_nl.c       | 2 +-
 drivers/block/drbd/drbd_receiver.c | 2 +-
 drivers/block/drbd/drbd_req.c      | 4 +++-
 4 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.53.0

