Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B826926F7D2
	for <lists+drbd-dev@lfdr.de>; Fri, 18 Sep 2020 10:17:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A43A9420E70;
	Fri, 18 Sep 2020 10:17:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 85BA7420E6D
	for <drbd-dev@lists.linbit.com>; Fri, 18 Sep 2020 10:17:18 +0200 (CEST)
Received: by mail-il1-f196.google.com with SMTP id t13so5408976ile.9
	for <drbd-dev@lists.linbit.com>; Fri, 18 Sep 2020 01:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wXvOOiaQRudfHjJGNTB6BCcV5zcosm6SCm0M9c5CiDk=;
	b=fC0JTvyTu0Q4UvoYUszOhdWpuTmmUb43jSo7xfXDPKwH4RWXPDu1Qy2FWqLhnTfEYv
	vm0eMK23CE6QDHIYPofa8OLSBwgx1DdQH1fL/JYaZTjwORhNXjaggDldQ1SEAOmkSd3e
	E/ymVEquFQ0Z8rdfx2XKRl1l4938ltPiMgnwBDlFO/EQeuLuUGE1Q2RccqfYOPOuWqXa
	KgtcVPcAGkbYQ9AHu67x42B00hsKvb484RnsRNApx78tYWQ3hOQpVPSw+Lm8Qv8ie0AC
	xoSH5SJ/wSh8JEMc8qV2D0Gu8HKDREjz/CggmWEUiiNZIz7Mpg6IAbzJerpCNS6LmwRN
	ezzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wXvOOiaQRudfHjJGNTB6BCcV5zcosm6SCm0M9c5CiDk=;
	b=RdoRR55QPO3AE6NRN4CqkEKjTZDfB/zPSFmyOJJkMuA1IDx8Ez+gR4Ejc/XCkNXi6w
	8GVbBp9iwbUnNs7ugKy7enZPQUu3aLuVKihvbO5igCqp/cRpgtrmwveMKmdVqyQCO2Ky
	U8OHD8o8xmiRlnWjveXLW/JVPuiLr8Y64bsxDgV+FOsBn2DW/mY+gGb3QlsTj4Ypn7ob
	ggsWwnpixvnQNzuGpO81Q0BOp+GutypfvFSkIGcNgVx5WpR6kl/459EjUC7hO46jnVVX
	1vDBjnsbgJ7v6+f2utKn6AroUr2YvxSz+8dkCUToxTNEgX0rrNjqzLhe9quNK7EzaioK
	RSSg==
X-Gm-Message-State: AOAM530uo3P6wbwkWpRT3c5cBglG3J3bjJs6pxPfzOD6rmfh5NTKfBKX
	CASrTGjz7xrRQy+fah8i1SOlXA6G0dAGmKAkgKR2cYx/pJbFQg==
X-Google-Smtp-Source: ABdhPJym3iNQINxGnULO2bezoMKS+8phrfIH1L0LR2iSFBgfJ5N5PM/rcQxAKxcPr5XenGIOBNFnctc/6txdK81gHvo=
X-Received: by 2002:a92:d785:: with SMTP id d5mr21350884iln.123.1600417037421; 
	Fri, 18 Sep 2020 01:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <1600406553-15012-1-git-send-email-dongsheng.yang@easystack.cn>
In-Reply-To: <1600406553-15012-1-git-send-email-dongsheng.yang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 18 Sep 2020 10:17:06 +0200
Message-ID: <CADGDV=VDM37fE+9_nY8xevuFZJ03DGcy9Xz84RKkaCg4FLW8-A@mail.gmail.com>
To: Dongsheng Yang <dongsheng.yang@easystack.cn>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd_state: dont clear NEW_CUR_UUID when
	re-gained quorum
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

Hi Dongsheng,

thanks for that. It looks correct. I have applied it to the drbd-9.0 branch.

best regards,
 Phil

On Fri, Sep 18, 2020 at 7:22 AM Dongsheng Yang
<dongsheng.yang@easystack.cn> wrote:
>
> We cant clear NEW_CUR_UUID when we re-gain quorum, because
> there is a secondary offline.
>
> E.g:
> There is a cluster with 3 nodes, 1 primary (node-1), 2 secondary (node-2, node-3)
>
> (1) all uptodate, primary with quorum=2, quorum-minimum-redundancy=2.
> (2) node-1 network error -> node-1 lost quorum
> (3) node-3 down.
> (4) node-1 network recovery -> node-1 regain quorum, clear NEW_CUR_UUID (node-1 uptodate, node-2 uptodate, node-3 offline)
> (5) write data on primary node. -> as NEW_CUR_UUID cleared, the uuid is old.
> (6) node-3 up. -> as the uuid in primary is old, same with what in node-3. there is no-sync.
>
> Then we will loss the new data in node-3.
>
> To fix it, dont clear NEW_CUR_UUID in (4).
>
> Fixes: aaaa257b837a26ac4a38f2e86632d682fc57a2
> Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
> ---
>  drbd/drbd_state.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
> index 5b1744a..358bcc0 100644
> --- a/drbd/drbd_state.c
> +++ b/drbd/drbd_state.c
> @@ -2592,7 +2592,6 @@ static void finish_state_change(struct drbd_resource *resource, struct completio
>
>                 if (!device->have_quorum[OLD] && device->have_quorum[NEW]) {
>                         clear_bit(PRIMARY_LOST_QUORUM, &device->flags);
> -                       clear_bit(NEW_CUR_UUID, &device->flags);
>                 }
>         }
>
> --
> 1.8.3.1
>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
