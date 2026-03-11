Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBuzF7HJumkLcAIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:50:09 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 18DBE2BE992
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:50:08 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0BDF5162806;
	Wed, 18 Mar 2026 16:49:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3650A16084A
	for <drbd-dev@lists.linbit.com>; Wed, 11 Mar 2026 09:35:36 +0100 (CET)
Received: by mail-wm1-f53.google.com with SMTP id
	5b1f17b1804b1-485345e1013so5366725e9.1
	for <drbd-dev@lists.linbit.com>; Wed, 11 Mar 2026 01:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1773218136; x=1773822936; darn=lists.linbit.com;
	h=user-agent:content-disposition:mime-version:message-id:subject:cc
	:to:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=EjRjPg4FR7ijjXynwuypftW1LlG57LuGHtatoIrW9iI=;
	b=SMLHbQohJR6w8CS5rFevsfF9Jljsq5vxu+YOmSvPI54o4hKt7d3ligyQvcpfqMFtqh
	Q5uzqFF+nqTJnRRvRBh7jpBhBOdyz0UiHlDUjhOOvO5954jFQIlE28Q0cDVL9NOp+dm4
	BF7ZPNuU4tl1ZUK4wcu1SdfK1VnYY+IOndAQZvtjF7BVkMO8vAUiV+ABYCkRWcec4bpC
	UvTbYgwNsA0d+uJ836ht0OZZ30qL+ydxhYS0H1LBHcYRLZrr0gaEELwBGBvKU3JW+cUB
	9q/tLKQ4OBHliMXjHttL+wv0KsjEl28CzJabZLYE1PT2OJjUZDpMHAZ/oHecSY/NXpzd
	ToqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1773218136; x=1773822936;
	h=user-agent:content-disposition:mime-version:message-id:subject:cc
	:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=EjRjPg4FR7ijjXynwuypftW1LlG57LuGHtatoIrW9iI=;
	b=OJXKvQmUMRE+zrXxsp+nM585cLHgtNn7BRgM0XIRWEeKNjSV8aRUb8uzSsCrYQbiqQ
	2j11gM+C5USv+29wnYgRFY/RWsoaSDEWx9Hc7jobmmbP2DV3lLmYnJeJBEj+6nE47ftW
	SaHtoGuycGpcUFRo0xlNlKxI9bKSwqDx9MOw8stESbQVNngA8xo0iXWkqPpExX+hj+G6
	acvR3316WL9UK0X3Wnj2z1W377e61gp4fuvjfjOllT4CrhUHxUiU3uSG+fOblzp1dROg
	MqjNSmyH04IHGgkB2llo3Jv4ZBV/ptPWrbiqnArufOLmLtLe1wJUwESovhBvbW1a8CvK
	8V2Q==
X-Forwarded-Encrypted: i=1;
	AJvYcCUfkxAQ6+nLKl3rhsfa9s9sSz+sRbQYCBYBAO3YBTsb73BmZMvSvOxZmt0crlmOrhKP8lU2i/o6yg==@lists.linbit.com
X-Gm-Message-State: AOJu0YyWB0wqXFSBuciNA7N39MN5I2iCtEMrvYOFd5PRcnN1rt19xoak
	BYZH6DlmLzYZtUtADkKzK5VNTyXmkaVqUGWthZkA71sxe233Q/BSAPwMKidRav/l9Gw=
X-Gm-Gg: ATEYQzxSDqcf4Gpx+C3hLeI6opOI5ojtr+Q6wTjiDhn35j8UHK90w3ED3cFimvEHuCb
	ilg9zk4/SrsfDcM7PKruG/5vtacOPdNc/6PexbHRQB+jLtNoNQJDA5OP0Qt0Frg7zRBBa9CLu57
	aE4kyOi3N/t+oisTJ9fxzVkqEG0DspHGpUx1vRI0s3JgB2s2YrjwsvQTUYcVcIdZ4m5Prm5m6Wc
	gFBkRXcfxn+vhHE0zyQEpPDyHk+S+lpVAFFbkOvw2tEQZmMYhzXDlFU591vwlCTS3wu8iwwMZ61
	T6P8Hi8ySaeluXbUfm8z5gyWo/Xew2JL/dU0l49i507iuOgqZd1ziFf1Kd64aedcwGCifKQ9mYR
	U3rm97tzHLcbrLT2oYfBny5RUfw6ZKCkw7bu6ITyYfagM04Ba+fY19STSdEzr/j1EstYWDzsDRt
	U2h/Vt81gZ/pDInMIOs2/HxN1TgbJqcrcoKy0J8nXEndjU/HluRDT8MTHbezJUeT6ESg==
X-Received: by 2002:a05:600c:870f:b0:485:4035:53a5 with SMTP id
	5b1f17b1804b1-48541a447d4mr146819915e9.12.1773218135634; 
	Wed, 11 Mar 2026 01:35:35 -0700 (PDT)
Received: from r1chard (36-228-122-64.dynamic-ip.hinet.net. [36.228.122.64])
	by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-2aeae24a91dsm22493095ad.31.2026.03.11.01.35.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2026 01:35:34 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:35:31 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Philipp Reisner <philipp.reisner@linbit.com>
Subject: [PATCH] drbd: fix pointer cast spacing
Message-ID: <20260311083510.183631-1-richard.lyu@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Mailman-Approved-At: Wed, 18 Mar 2026 16:49:43 +0100
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	DATE_IN_PAST(1.00)[175];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[richard.lyu@suse.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:axboe@kernel.dk,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:richard.lyu@suse.com,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard.lyu@suse.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.600];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 18DBE2BE992
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Checkpatch.pl reports the following coding style issue:
ERROR: "(foo*)" should be "(foo *)"
+		struct p_trim *t = (struct p_trim*)p;

Place '*' next to the variable in the cast expression to follow
the kernel coding style. No functional change.

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
---
 drivers/block/drbd/drbd_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index b8f0eddf7e87..978023e969f8 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -1681,7 +1681,7 @@ int drbd_send_dblock(struct drbd_peer_device *peer_device, struct drbd_request *
 
 	if (dp_flags & (DP_DISCARD|DP_ZEROES)) {
 		enum drbd_packet cmd = (dp_flags & DP_ZEROES) ? P_ZEROES : P_TRIM;
-		struct p_trim *t = (struct p_trim*)p;
+		struct p_trim *t = (struct p_trim *)p;
 		t->size = cpu_to_be32(req->i.size);
 		err = __send_command(peer_device->connection, device->vnr, sock, cmd, sizeof(*t), NULL, 0);
 		goto out;
-- 
2.51.0

