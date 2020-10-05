Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD5F283CA6
	for <lists+drbd-dev@lfdr.de>; Mon,  5 Oct 2020 18:40:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 67837420A86;
	Mon,  5 Oct 2020 18:40:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B94BE420A75
	for <drbd-dev@lists.linbit.com>; Mon,  5 Oct 2020 18:40:04 +0200 (CEST)
Received: by mail-il1-f177.google.com with SMTP id t7so3170140ilf.10
	for <drbd-dev@lists.linbit.com>; Mon, 05 Oct 2020 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dZSZ5kzSBxmgO3EkC+7hniQauMKPKijAIyqy5Tah1xM=;
	b=DMCMYq7tDVZ5xjleAe8GNo8iq5nFxJWkkW69qKE/+Z7shdLawIYWij9p36m5dgiHzk
	uveysvQThLy21q3WF+211cm+a04id1rDsMgA7WwcCHEdgwFCjG6ppu/ZcezKwjbRRxZK
	nCeJeJIOIwOzdOphwb/X/7hwpJVcnn839KCM0rcaBa0tchnlpHwNXbskpMdpnrVkH06T
	G6kvyf6Hvr7BMjS/ULe1F28m6fBbFnkrWLdn4TBa2JSY0LoCc9m9bXg4p4PXhj3w3XcM
	VX8gj+qnRlD0yfpfF51qhOjueh53+Zm7PwW3m1uMMMazAabhlHrE3IqocQ1/IM44iMvY
	/uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dZSZ5kzSBxmgO3EkC+7hniQauMKPKijAIyqy5Tah1xM=;
	b=WvTDR2AwaCzPDYwwIn0U8Zm/tvJrkMTiLzxnqdYEHOa/RKGHe45MMw58CTS2PTDPxd
	yXhI0/cu60JcS5R7KdP8IIEjVYNySzt00LqgRkFfZPjL4sNTFpRG1PfmKIMW9sw+nkPD
	LllnXOz7Q02zTWHKiY/vF0v81MveRFPFSIAXDIAVFxUiNStTlwJlI6mIlGjqvVlb/cU6
	5khhftBAApMJLkx3YXx251KCn+U09pN5g4sxmQNb2IMq9JTcAEc4SUSVzIaCNS5MtQAz
	Nnv0+S7s9pKZSwPNJZ/iAOiFq4l+t9jNwNOpzGT49JqmjqQKFuiaEQm6s9gYCKcvF0/P
	4lFA==
X-Gm-Message-State: AOAM532nC/FCUmaezAArmX5nrzuEkpLuMfUxGGf22E2jSSL1BaA5Wuqq
	pd9z0SqSJN+DwKE31gniEnKV9imdTluqWw==
X-Google-Smtp-Source: ABdhPJzFKmWiZiCSBV85FRdV06a1XMN4EpaIO48aWFIp6OAILZ+bb7mP1aNHeIHPBPIFxi1ILmriVg==
X-Received: by 2002:a05:6e02:11:: with SMTP id
	h17mr194184ilr.300.1601916003509; 
	Mon, 05 Oct 2020 09:40:03 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id a21sm194797ioh.12.2020.10.05.09.40.02
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 05 Oct 2020 09:40:02 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200925160618.1481450-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <20798679-80af-50a7-64f7-0af1af78ab16@kernel.dk>
Date: Mon, 5 Oct 2020 10:40:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925160618.1481450-1-hch@lst.de>
Content-Language: en-US
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [Drbd-dev] remove bdget() as a public API
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

On 9/25/20 10:06 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series first cleans up the somewhat odd size handling in
> drbd, and then kill off bdget() as a public API.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
