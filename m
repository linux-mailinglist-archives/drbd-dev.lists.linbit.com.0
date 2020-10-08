Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3A4287CF0
	for <lists+drbd-dev@lfdr.de>; Thu,  8 Oct 2020 22:17:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3F667420FED;
	Thu,  8 Oct 2020 22:17:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EB459420FED
	for <drbd-dev@lists.linbit.com>; Thu,  8 Oct 2020 22:17:46 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id r21so1919205pgj.5
	for <drbd-dev@lists.linbit.com>; Thu, 08 Oct 2020 13:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mRwM0Y2OSmF79xkRQZ5J4gQg+TTvbMu62ytl+MfGImc=;
	b=QOy5ZK8e3qud9rKw05d4GoufSl8XLBo3nVC/mO3hDSOsxpbOKgSxHun1Ex6wZi3uKc
	/vdhBp2L4h6sOGB5a7WsUl21i14MPN9zTH37awglL3Ll+pPKW975GYVVhDabcfvUxKnv
	m2u/PIyaXtflkjUyfmoSnlvFoHABpdlBkWdyUyjkBu3nYi0YpfSZVYwi5KHmr3Y3by4W
	nFThAW4i8SgcSXARV4ohcmjigGlziujSSLN7IupPU5os7/hTT9CjUpGAutEmWeByU9+4
	bH0kGa0vloSwz0rVB+cX9q5het88DHcIvy8UNghSim/JmJnfeRzhfdlfxFQSGXa0NyFg
	mi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mRwM0Y2OSmF79xkRQZ5J4gQg+TTvbMu62ytl+MfGImc=;
	b=KEAznsxfGF8zv7fSrTEGPCj3PQoE6MHWjlqwrMZ/3H10KF/XzYFoO/HjylBpi3lbaO
	MW0q4TeSqc6VRcMivoLE6QH8Nh+1AlDUc3kTjF8vJ/onTJMHgunqtV/zWUUr7WAWy/2g
	8htNzAODS6H3HoLQDpFqAkRnZqs6QliyexyuKqGyP3/J41TeEOz+ZE5cgvpMq1LivFcI
	jBPzkupHFwskJFfANq8PYV4Xb1FIcd+GpkMeDnY9XumQhqmZ6+m091ectewF6V5uuhQN
	8SpgV3pN6joi00ETb9Zc8lUERLAi0KVys/zlN6ELmPI13twlfMIGtZkFg3nf+DP5jSq3
	s1ow==
X-Gm-Message-State: AOAM532hFs+LSLcIjvu0Se37BKmiu8jXvjTku5/8EdLLT/wG9/XBOAwA
	1vCoS3ub9dzXcYZ1KhjJpEi5UQ==
X-Google-Smtp-Source: ABdhPJyrEiJ103CqNMkdVeceuGn0jLX1sSjQCz00oPZplp/Qz9p0AFVypMlc6kEdUNyQiGypFdHH3Q==
X-Received: by 2002:a65:67d4:: with SMTP id b20mr493567pgs.245.1602188265462; 
	Thu, 08 Oct 2020 13:17:45 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
	by smtp.gmail.com with ESMTPSA id y4sm8963325pjc.53.2020.10.08.13.17.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 08 Oct 2020 13:17:44 -0700 (PDT)
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Christoph Hellwig
	<hch@lst.de>, dm-devel@redhat.com,
	open list <linux-kernel@vger.kernel.org>, 
	linux-block <linux-block@vger.kernel.org>, drbd-dev@lists.linbit.com,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
	<linux-ide@vger.kernel.org>, linux-raid@vger.kernel.org,
	linux-mmc <linux-mmc@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	lkft-triage@lists.linaro.org
References: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
	<CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
Date: Thu, 8 Oct 2020 14:17:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
Content-Language: en-US
Cc: Song Liu <song@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Hannes Reinecke <hare@suse.de>, martin.petersen@oracle.com,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [Drbd-dev] [ Regressions ] linux next 20201008:
 blk_update_request: I/O error, dev sda,
 sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
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

On 10/8/20 2:05 PM, Naresh Kamboju wrote:
> On Thu, 8 Oct 2020 at 23:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> There are two major regressions noticed on linux next tag 20201008.
>> I will bisect this problem and get back to you.
> 
> Reverting scsi: patch set on  linux next tag 20201008 fixed reported problems.
> git revert --no-edit 653eb7c99d84..ed7fb2d018fd

Just for everyones edification, that would be these 9 patches from the
SCSI tree:

Christoph Hellwig (9):
      scsi: core: Don't export scsi_device_from_queue()
      scsi: core: Remove scsi_init_cmd_errh
      scsi: core: Move command size detection out of the fast path
      scsi: core: Use rq_dma_dir in scsi_setup_cmnd()
      scsi: core: Rename scsi_prep_state_check() to scsi_device_state_check()
      scsi: core: Rename scsi_mq_prep_fn() to scsi_prepare_cmd()
      scsi: core: Clean up allocation and freeing of sgtables
      scsi: core: Remove scsi_setup_cmnd() and scsi_setup_fs_cmnd()
      scsi: core: Only start the request just before dispatching

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
