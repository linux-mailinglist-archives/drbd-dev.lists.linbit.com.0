Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FED409725
	for <lists+drbd-dev@lfdr.de>; Mon, 13 Sep 2021 17:21:59 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BFE784205F3;
	Mon, 13 Sep 2021 17:21:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8C7BF4202EB
	for <drbd-dev@lists.linbit.com>; Mon, 13 Sep 2021 17:21:57 +0200 (CEST)
Received: by mail-ed1-f54.google.com with SMTP id z94so8742491ede.8
	for <drbd-dev@lists.linbit.com>; Mon, 13 Sep 2021 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SbkKf4fUF/+qim1zP17FpFwsNh1M7naPyvvJgNAsk6E=;
	b=fxJcZhGLFukIwBv3H6GjYGHNtBL/uUiLbwXcfynGauGMJuq03zOEDsN4/zgbltApqf
	hQFXQdQSmE3cFar33hodLE1izcFwciaxRw+6n+dmOcEzJv8fA2Zu0mK1lQK3vzKkFG1l
	wJcHqBSgJrxTLgs8TF2sKJ1gKnm7TR8Tc79BHcNbE0NOC4f8v2z+272WoLnV+5NyE1RS
	B+Fs17TrXKXghPRiN4GkNbvnAppTngUV6w+fC5bh+zx2pYz43D0hgloHqs+X0WECXpfP
	FQxy6iNcgixoii/I5SFUCNDuAlSZfCB10hvoEGqc8UoP5QshhDes3AO05roEUmGMKbA6
	zQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SbkKf4fUF/+qim1zP17FpFwsNh1M7naPyvvJgNAsk6E=;
	b=nVu811Gc6jP1W04zixAEdKbtd4x2QXYT3GhHnRzsdmU6Xhf7+OAUgqxLCpTK8Xojek
	bhCAu1ZRVSIYr7MXlrNjNPL4UQ26SxvO8kP28k+T/miI5trlzMViDDLy07jjdpJHDBFE
	ME7YF+62p/JWwGWgHt2uPFBf3dJvpFxl8j4Qa2CvKXIGib23adlHTNDWwWwMYjSLW8/G
	oyCojwB4hqw3+bu2EnLj2MfTIAn2n2YlSnTRb85EwaJ9sGO5Q3nt2AghRFwRkq2nk+jJ
	dir6OgLoDfIvsdDH0r2pqfiDN+ES5OlMx96v51P8Vx/3BEphc9QpxbXjmKFWTJRrX2QA
	cgGA==
X-Gm-Message-State: AOAM531JSnU8sOYPyoK3m97FJfONsfz8dyDScTdFo1MLihUUc4OGHShO
	4Do8eLvUZBrLypmXebVXUxYuFHnhPwHAPxg0Mb9v6vmsiY8INCaH
X-Google-Smtp-Source: ABdhPJzQEH4M7Ug1kI5VMPDeX3+hX6QFFWrtKdxRLI8oW5jVLENc2poZ82FxnTV809+UAWYHdg9ROjfvTILwmhPHBAI=
X-Received: by 2002:aa7:ce14:: with SMTP id d20mr13578690edv.132.1631546516718;
	Mon, 13 Sep 2021 08:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210910054011.1115655-1-rui.xu@easystack.cn>
	<20210913022708.1195173-1-rui.xu@easystack.cn>
In-Reply-To: <20210913022708.1195173-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Mon, 13 Sep 2021 17:21:46 +0200
Message-ID: <CAGNP_+VFUJfijkem8TWr1ptkJXbdZryuvbnpLY1GCBgPvKzdzw@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2] drbd: fix a race condition in
 update_sync_bits() and receive_bitmap()
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

Thanks for the contribution. The problem description and patch look valid to me.

Please add a brief comment to the code explaining why it is important
to evaluate is_sync_target_state at that point.

Here is a cleaned up version of your commit message. Is it still
correct? In particular, I am not sure what the consequences of the bug
are. "resync finishes in an unexpected way" is vague. I wrote "even
though bitmap bits are still set" but maybe there are other effects
that I have not thought of.


drbd: fix a race condition in update_sync_bits() and receive_bitmap()

There was a race condition involving update_sync_bits() and
receive_bitmap(). Consider this scenario:

Primary: node-3, Secondary node-1, node-2

(1) Network failure occurs on node-1
(2) node-1 network recovers
(3) node-1 connects to node-2, and starts resync (node-1 is SyncTarget,
node-2 is SyncSource)
(4) Before resync in (3) finishes, node-1 connects to node-3 and starts
resync (node-1 is PausedSyncT, node-3 is PausedSyncS)

The following sequence can occur on node-1 while it is syncing from
node-2:

* ack_receiver thread processes P_PEERS_IN_SYNC
* ack_receiver: call update_sync_bits()
* ack_receiver: clear the last bitmap bits for node-3
* ack_receiver: set rs_is_done to 1
* receiver thread processes P_*BITMAP
* receiver: call receive_bitmap()
* receiver: set bitmap bits for node-3
* receiver: set the repl_state towards node-3 to PausedSyncT
* ack_receiver: set RS_DONE flag

This causes the resync from node-3 to node-1 to finish even though
bitmap bits are still set. Fix this by evaluating is_sync_target_state
before getting the bitmap total weight in update_sync_bits.

Signed-off-by: Rui Xu <rui.xu@easystack.cn>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
