Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 164C849ED8D
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 22:38:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B4CEF42A58B;
	Thu, 27 Jan 2022 22:38:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 677E54201F8
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 22:38:18 +0100 (CET)
Received: by mail-lf1-f51.google.com with SMTP id x11so7947277lfa.2
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 13:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z+U+izVFukrEKq10kL5qCCsiT3qJmeLAo+mnNrOVCPU=;
	b=DwtRea8LCCOg/PGJHjd1bTltmn0bHa2clILkAwGYtZppoAY25qIBMTxyD6B5uMLit6
	7wk+d+sZiWX35l8wQaAoyrJ9H5CizW30SYci3NU1ojzD14qB67btK2MGpyfbQ3U8Fswu
	zxqpCDGkYCIAg/NDZ5r6/eIuacbMkuvBlqu9ammCZDYbuScyx0/VXZFI/czsoS4aCdCY
	RzPo3aqhubsJoGDCZLj5SmdkiGyLla36RWFVNiU5MVGZ7MrbcY5xEOS4+eUv/n2M8qYN
	MVuY5Y428ZMyJxOjYYJ1BtbtHPjLQ+HBbJ/bfmBPwl0UHF3vKl1N9F7XDbteSxFshMZ6
	OfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z+U+izVFukrEKq10kL5qCCsiT3qJmeLAo+mnNrOVCPU=;
	b=jqtTOFFDGzifxNpnlUiGkgXbQu5L/I3mtVlrzKsUCfZRyzqIGh3DjcKqS8ZBYilYLV
	SVq1jkC+rX4cHWsSJJrhMakXGsPEMy46Hx0UA+iIewMb9EiPNMVpWbmWCSAm9IjoyY19
	AFNYiJImVavFOznQu9vrC9z+ztydu1oW+9NZIs4JUmFSTGClNbAfD+r/JiuOtdCieve8
	zEUxi79Aeqss/aUCygtpj6kTtijDdoO2WBjEZWovzR9F+Bc4dgh0H0yxoEQ5R5QZ/uEW
	dd9XuxTTeAG61rvmbofD08+0VokkU79zo80b3gs7ACclZd1hz4hS5k9aTnpIMxKCENuK
	hoJQ==
X-Gm-Message-State: AOAM532F5kIV7fqOA1+SSQzjNZ/4Hc4+k4ul+SKhdpvVUw5PoiHm3ru+
	/VvFmZ/LMXxS0sHxRBxYKGVLK5RRy1xzB5Y8dfw=
X-Google-Smtp-Source: ABdhPJxaVoQ4SfBVmSOjFCGrgluhZGplrFWaRNqk5pMVob8JHRQWRWEKNtxwMeMPmpBWjy5SR70YaIdo0zrC/X/8wRA=
X-Received: by 2002:ac2:58f7:: with SMTP id v23mr4043478lfo.390.1643319497799; 
	Thu, 27 Jan 2022 13:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20220124091107.642561-1-hch@lst.de>
	<20220124091107.642561-3-hch@lst.de>
In-Reply-To: <20220124091107.642561-3-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 28 Jan 2022 06:38:05 +0900
Message-ID: <CAKFNMomoLqbbOwg5d6aBHCyGT5v+NF=N2Rm3QwYk8NDXsoJHtA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-nilfs <linux-nilfs@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.co>,
	device-mapper development <dm-devel@redhat.com>,
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 02/19] nilfs2: remove nilfs_alloc_seg_bio
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

On Mon, Jan 24, 2022 at 6:11 PM Christoph Hellwig <hch@lst.de> wrote:
>
> bio_alloc will never fail when it can sleep.  Remove the now simple
> nilfs_alloc_seg_bio helper and open code it in the only caller.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/nilfs2/segbuf.c | 31 ++++---------------------------
>  1 file changed, 4 insertions(+), 27 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks!

Ryusuke Konishi
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
