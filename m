Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C25549E838
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 17:59:07 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2E3774201BE;
	Thu, 27 Jan 2022 17:59:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 302 seconds by postgrey-1.31 at mail19;
	Thu, 27 Jan 2022 17:59:04 CET
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5EBF8420012
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 17:59:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643302743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=AGOKQqcuQhkDwTPU+rhG3/lUwVIbdjyWIj81munfXW0=;
	b=Q0MZFSQItP4YrHobMG8wddvn2wJFqDUMPeLQh0QmQMNLSNMSOrEgQKylV2yONtuYa2/19/
	J+lC7a1y4mo+qqIhOeGg7xHZLn4pZB5blOQLCDEMuWElsWh695nkMp8LTyHftOKp6VwAuN
	+Uhs45+162oHyxkCsp95OddI/h9bzsA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-22-xuLEYJ_DMHC-Y3GmTfETmg-1; Thu, 27 Jan 2022 11:52:53 -0500
X-MC-Unique: xuLEYJ_DMHC-Y3GmTfETmg-1
Received: by mail-qk1-f197.google.com with SMTP id
	u12-20020a05620a0c4c00b00475a9324977so2773498qki.13
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 08:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=AGOKQqcuQhkDwTPU+rhG3/lUwVIbdjyWIj81munfXW0=;
	b=TMZ/de2HGsJtoLMnEIThzef9XOC0YiauaEsdYvlHEL3+7W+R3PJ832BYPzKhCJbbGX
	yK0sgdIGCT7Enjc8sEaYOwm4fI168U8tV8oC1k20f6OXRNybxD3TGnLJ5neiA+0rsRFu
	SQ+kVNBMm9YXMO1fcsr/J9NehC7fE61kHqt9OOCeg9TpGgYJFMzb8+/5dDy7xaMOo5/J
	Ryem2RkVe2DpbvGC61O2i1pXmxEbxVMhLRDupqOKBOUcmHlZRN7k53VrrRtdEXbV1LBD
	5Eu0U125PXUgEhaOpoYs6WqicYDm4av1LTHefdvkhYz6T/dYvBfbPMYCPhCa/J716tCB
	7HXQ==
X-Gm-Message-State: AOAM5308TdRFw/+Vt+KJDr+/4XZkcKGLge/kuRPQ3Xe1VTTHY+axa9Ak
	JrP2QoZFvovbI6AUiNbNYijtGh4o/Ho6CkhVLH0e4zlRsuQW93eq7IfUZCYICTvw7mfLJhkfDZj
	49AdFtOodohohTh/ddns=
X-Received: by 2002:a0c:fa09:: with SMTP id q9mr4322349qvn.21.1643302373426;
	Thu, 27 Jan 2022 08:52:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2rtqqWw8vSSkq/pAGCHoYHXJ1BiURlAQlul/eODmSBNf8OGMbqxmxG8mMS7PpEMI9YH9jUw==
X-Received: by 2002:a0c:fa09:: with SMTP id q9mr4322338qvn.21.1643302373224;
	Thu, 27 Jan 2022 08:52:53 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id y15sm826432qtx.28.2022.01.27.08.52.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Jan 2022 08:52:52 -0800 (PST)
Date: Thu, 27 Jan 2022 11:52:51 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YfLN4/2bYe4hebCy@redhat.com>
References: <20220127063546.1314111-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220127063546.1314111-1-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] improve the bio cloning interface
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

On Thu, Jan 27 2022 at  1:35P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Hi Jens,
> 
> this series changes the bio cloning interface to match the rest changes
> to the bio allocation interface and passes the block_device and operation
> to the cloning helpers.  In addition it renames the cloning helpers to
> be more descriptive.
> 
> To get there it requires a bit of refactoring in the device mapper code.

I'd like to take a closer look, do you happen to have this series
available in a git branch?

The changes generally look fine.  Any chance you could forecast what
you're planning for follow-on changes?

Or is it best to just wait for you to produce those follow-on changes?

Thanks,
Mike

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
