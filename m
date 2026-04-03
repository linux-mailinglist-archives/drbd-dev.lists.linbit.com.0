Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AXRHqq/z2kM0QYAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 03 Apr 2026 15:24:58 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 2192839469F
	for <lists+drbd-dev@lfdr.de>; Fri, 03 Apr 2026 15:24:58 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AF9131627A3;
	Fri,  3 Apr 2026 15:24:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 314961622C4
	for <drbd-dev@lists.linbit.com>; Fri,  3 Apr 2026 15:24:42 +0200 (CEST)
Received: by mail-wm1-f44.google.com with SMTP id
	5b1f17b1804b1-4853e1ce427so24151555e9.3
	for <drbd-dev@lists.linbit.com>; Fri, 03 Apr 2026 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1775222681;
	x=1775827481; darn=lists.linbit.com; 
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=6n47rxNp9qQZiQDl+S0Q6ioYNQWFTnZXhemat2t0O4Y=;
	b=gIXOm5mPK2BmqVO4Cmn2JaUKpdYoCXuu3zv1WeGIw9Mrc67/1QHU9M5DvzqHETHtiJ
	Pys/+AEQghEjCSve05jxRVkmF0zeqmOrLwDvThvEz13ayjppwsjbaf0J8o4EuXeONs/T
	4WPQ7/mHj9Mu8ux1sHj4hMcOeEGdE99VDcr1VOlRXDaMXmwnsh8WabSzUvYHl7EWVgmG
	xPQE3l9BNxh6cxoZnsBdZbaoOh0MLdt1BT/N/6xXyM1ZRXe1Jw5KmsXyba/ajxE5tDgb
	CO4zb0eZHH3XdkCnbFqUjaKv6vGxl3MPUtpUYoZuJLQeCRGBhp5P0yt0H2UwQoqL4pLd
	5nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775222681; x=1775827481;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=6n47rxNp9qQZiQDl+S0Q6ioYNQWFTnZXhemat2t0O4Y=;
	b=Y2Ofgk9KvszslW/rHn2DuJtzt6hU59PTQjaW5VkOYeG8ZvMCYp8R9AdB8J0Y42mc7s
	HW3kK+uadJJK6MWNmtpsE8rFa7jXHFyVSeqvK29f59tE3EUD7C9oDtF8d9SaK6D897Z5
	t93SP4tq5/NaFTlNp3Jfd+Tri3VTfYJXr2B/OiqiZ7NgAexxf2lj8aV2VUSKOdK/lkRt
	2My9LJ00eHi2N/oHBjKCb3kaSEBy/6bnfuPc95WH5UVaya4cvOHAKtbYjG1NuV6xOTdO
	ftsRyIXcw9ttR2bwu1no+ubOt4K+kn/paen4RLUwQaxIebxMPxjr48z4dVYvXPxIR75/
	BE1g==
X-Gm-Message-State: AOJu0YwycpH94LkRoMGhGaZcyabRiQUQU3qZPBkqBeXJnVKkHe7f2PAr
	bTm4CE0kJfr76I2H/231DBCk5Kj6J174jAKqnoVXDhhj0fCH4hinewka9g+WDZDIlbyx/g==
X-Gm-Gg: ATEYQzzA0xGYUMPgrSmmLqyj8Qo3PxoemlguzYeiiOz0vxSYw2p7a8W7CNhAj354HhH
	bD1ex4q8dwaFt1wCpIddsuuo3r5DYs27TvC1jQnstFH+4Oyw6IkorAxobMZnscgTTMLmQ9+WuNc
	Dsx/XNFjP+hdDWqQ+MNcPoj5jHxTOi4Cg6teGZ9krVFbyAwOd/4jNbHy9FiQlGzCs9Yib2JuPsz
	Hdi7ywIhrcoeprachRPcmIVrVoItopuclQ4UtXgs5jdhA9X4bCX/WWF2l/pDJls47Iapc2dEqLL
	fq3P7mcViEs/vG0hEULhqQDbIIKMnJfmieoD0EWPIKScyGE5975pyWJ+Dv9/buR/uDPPc18xYCP
	OutVnqBD+1ehML/+gLjRg26Nam8IU4VOYG6rBJclJMIYnxiEj9Z8G1N4NpGiVjbMrAaKy1stgDp
	efwZYkt7G2WsZUZJ7s2MO3ZoRViD6nQdgUtuTET2TSiFmYxftPTtyA9lv12dWE3IgJOtYFNwXOv
	qbczg==
X-Received: by 2002:a05:600c:8b34:b0:487:1fb4:7e1 with SMTP id
	5b1f17b1804b1-488997d530fmr48133275e9.22.1775222681521; 
	Fri, 03 Apr 2026 06:24:41 -0700 (PDT)
Received: from localhost (h082218028181.host.wavenet.at. [82.218.28.181])
	by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-48897fdd2cesm24952245e9.4.2026.04.03.06.24.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Apr 2026 06:24:40 -0700 (PDT)
Date: Fri, 3 Apr 2026 15:24:39 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 00/20] DRBD 9 rework
Message-ID: <ac-_fAsaSk-E_80R@localhost.localdomain>
Mail-Followup-To: Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linbit.com, 
	linux-kernel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
	<ecf00b4b-c3f8-4161-a97d-3d23b423cabf@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecf00b4b-c3f8-4161-a97d-3d23b423cabf@kernel.dk>
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
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
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.537];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	TAGGED_RCPT(0.00)[drbd-dev];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 2192839469F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 07:30:35PM -0600, Jens Axboe wrote:
>On 3/27/26 4:38 PM, Christoph Böhmwalder wrote:
>> As discussed (context: [0]), here is the first version of our DRBD 9
>> rework series, intended for for-next via for-7.1/drbd.
>
>Will you fixup the kerneldoc (nits) and the assigned-but-not-read
>issues and send out a new version? Also looks this series doesn't
>actually apply to for-7.1/block, patch 12 fails.
>
>-- 
>Jens Axboe

Right, the recent genl changes now cause a conflict. I'm rebasing now.
The nits are already incorporated and will land with v2.

Just for my own planning: what does your timing cycle look like for the
-next branch? I assume you also want to have that ready before the merge
window opens? Or is the schedule for -next more liberal?

Thanks,
Christoph
