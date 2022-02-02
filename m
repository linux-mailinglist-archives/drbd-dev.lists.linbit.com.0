Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5294A77F8
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Feb 2022 19:33:09 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 691964201FA;
	Wed,  2 Feb 2022 19:33:08 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D084C420181
	for <drbd-dev@lists.linbit.com>; Wed,  2 Feb 2022 19:33:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643826785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=53Uot1wvZSt1uP0+nqAgLg+8waHH8Mj8+skF7+R4kzQ=;
	b=YiCy9Gqm/S1JoEqKdSH7eoyNCHA/5nI7JQ4cMhBSSfffxdjnO3FhjLZZKLgbHOhOM2Iwe7
	w4440VBXbie9EEhqppjCtHJrrR6cPS3hY/ZHOi0B1B8cPhPT+jEIgUrjHuN6i5z5Tk3j5u
	VNYfrxasiSM3IKWf65rzvGIoTeGP8DY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-596-G5q-QxVRNlafgmfl4xjb_Q-1; Wed, 02 Feb 2022 13:33:04 -0500
X-MC-Unique: G5q-QxVRNlafgmfl4xjb_Q-1
Received: by mail-qk1-f199.google.com with SMTP id
	d130-20020a379b88000000b004e11e7b51c4so326438qke.17
	for <drbd-dev@lists.linbit.com>; Wed, 02 Feb 2022 10:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=53Uot1wvZSt1uP0+nqAgLg+8waHH8Mj8+skF7+R4kzQ=;
	b=OeE4ARm4MG20Bj7k0MSxUANVrziESPz/J5l1TZfvuOsLR69e7wy6A8RewKiGMU/rf7
	i4RR2bCppgXBu5zSWcDbYdQL+2IAHc+qemYlioQXSe2zd4fj41QCHATjhUZAfkXlaqOb
	7IJyiCoj2gfJffQy5ggNk0TNxG1nnze/upS7JG3hO8/it41ZTMpeDsajPg/E8zMow1ij
	4gWYEIB7OhtqgQANAkEXOm7VGaWYdz0mjSwwo/F0/X6WtWaCqd3llcKwLx6nIBAEMfLi
	CNaLQB47h6JTwk6JhfsQAPa0JfIlLpdFkKP5jaGXWcZ4kax4PsNfRXYpsk+IApmFDpQx
	lDDg==
X-Gm-Message-State: AOAM530vHIaBOzHJEkCYrr9O7B9WnW2k4oyUtfKBwpnemmuZfgn/+Arp
	pMVzlHbVNVUz/ctB+dgnsoOhjYmO7ezByJaPKL+TTiqVshv2uLK+2IMm3Ex501BVi1Q6qJ4o1gv
	vwQhX5C3BYwa8Mkd2W5Q=
X-Received: by 2002:ad4:5745:: with SMTP id q5mr27182559qvx.55.1643826784149; 
	Wed, 02 Feb 2022 10:33:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+xpPw5Ufa5QPVUE8hEtOkyVx76EUcpxqMD2VGXdH8iCwT01cOCO2Iq6GBrYUrepIug8Ij6w==
X-Received: by 2002:ad4:5745:: with SMTP id q5mr27182538qvx.55.1643826783950; 
	Wed, 02 Feb 2022 10:33:03 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	o1sm13822596qkp.49.2022.02.02.10.33.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Feb 2022 10:33:03 -0800 (PST)
Date: Wed, 2 Feb 2022 13:33:02 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YfrOXqVVwcwIoArj@redhat.com>
References: <20220202160109.108149-1-hch@lst.de>
	<20220202160109.108149-8-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220202160109.108149-8-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 07/13] dm: retun the clone bio from alloc_tio
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

On Wed, Feb 02 2022 at 11:01P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Return the clone bio embedded into the tio as that is what the callers
> actually want.  Similar for the free side.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Small nit, subject has typo: s/retun/return/

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
