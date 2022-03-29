Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB344EA876
	for <lists+drbd-dev@lfdr.de>; Tue, 29 Mar 2022 09:24:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 58C04420620;
	Tue, 29 Mar 2022 09:24:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
	[209.85.221.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AAAA942018F
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 09:24:44 +0200 (CEST)
Received: by mail-vk1-f181.google.com with SMTP id 47so3919818vki.12
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 00:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pL+Cp4iZbwgLcxUWKxODDZPNpYMnhx3erX4iFxsT0IY=;
	b=T2X5MvUivqE5mgGVO92sTOil53SIfwWtVoWix5F1x5/LbLmTJinRQzydeIjsOg+oYm
	pKDi6tgHEHYKB3OTiYFgcyri+RIF4Qn9qCIuKBnQ1Ol/qoEXzmd+qvThYxVafmsd6YDd
	3UpcuL/FjUuxWcpFOoyJFuVabitOWYdb87YBN4vgSkLQRa3MovqdaeuuHzbtqdC8ModF
	4y/cffHuq9h74/FNSFBBxy5AHd26Gv6zhaEEGx++3d5FVkVSDcR5K58YEvvQiFM9FtZq
	z87LdY/aWEQ2eZk6XGd97IZzuVcXmea6pv2SlMJqokJ9cY6SzGdMyMCMZw1lYb4rHAYy
	+QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pL+Cp4iZbwgLcxUWKxODDZPNpYMnhx3erX4iFxsT0IY=;
	b=3z0IQtqk/zeVo6ATsnUkwdod/6J3I15/ioNpLzo4KlUL1UI9gD0PHC1zNSHqa/4lDJ
	zAWL67khMa61HLFkDWT1il5qHrXhhiY55PFgi5YIZM+lEOVCunoCq9vy8VuqG5jmZQKe
	lu/APl4PmmTL5b/FgemuPSbHM5p6w7D+DxKkSfKxYqYFtBb1XC/9I0W//CwFLzLHBz7c
	fMCubqqpjLKEnB6SVpoVnSnJ+vOHBUZrrbLaKr5yJVbcamNU3o4Lxj3mkQUeDWY5cTbN
	X6ZCET/cOOIM/Kwuh2WTlSCjRit4/wotLlnyxapFQTrTMbEYdLtjbLG6vdBtsLkqcNj4
	2Y/w==
X-Gm-Message-State: AOAM532DaMv3oZJT+B5aVNAe0drv2wHvWnz6OvuGFNcy+iAk8Mm8cvVH
	Bbd9/AoNwkuQmQSVGDXWcnyt6OX7i8Ik+efj86nkWAu3
X-Google-Smtp-Source: ABdhPJx+IvOLBtbExo85GXpQ1kupYL8mOSu3U3yGjfkVfzkRpmTZcfCSmQYoicsRKDWxcSVJxNJYCXyWphBtDzrQDWQ=
X-Received: by 2002:a1f:6a82:0:b0:33f:7eeb:5989 with SMTP id
	f124-20020a1f6a82000000b0033f7eeb5989mr15757736vkc.29.1648538683833;
	Tue, 29 Mar 2022 00:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220329070618.GA20396@lst.de>
In-Reply-To: <20220329070618.GA20396@lst.de>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Tue, 29 Mar 2022 09:24:33 +0200
Message-ID: <CADGDV=XrhzSxLyES9dtKj1-cQq6Zh32psipLJCoDGRNzAYaZwA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] state of drbd in mainline
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

Hi Christoph,

what do you expect for the DRBD changes? Usually, they fall into the
category: yes, obviously. When you are changing the block layer in
this way, then that is necessary for the in-tree DRBD code.

Regarding users: Yes, there are users of the in-tree DRBD code. Very
big corporations. And, yes, we see pressure building up that we get
our act together and re-sync the in-tree DRBD with the out-of tree
DRBD.

best regards,
 Phil


On Tue, Mar 29, 2022 at 9:06 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> while I've been reworking large parts of the block layer over the
> last months I've basically never gotten drbd reviews, and in general
> drbd seems to be completely maintained upstream.  Do we even have users
> for it?  Is it time to drop drbd from the kernel tree?
>
> Thanks,
>         Christoph
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
